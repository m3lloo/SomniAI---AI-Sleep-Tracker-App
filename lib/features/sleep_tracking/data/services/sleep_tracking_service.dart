// lib/features/sleep_tracking/data/services/sleep_tracking_service.dart
// ignore_for_file: unused_field

import 'dart:async';
import 'dart:math';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sensors_plus/sensors_plus.dart';
import '../../../../local_database/models/sleep_session_model.dart';
import '../repositories/sleep_session_repository.dart';

enum TrackingState { idle, tracking, paused, stopped }

class SleepTrackingData {
  final TrackingState state;
  final DateTime? startTime;
  final int movementEvents;
  final int interruptions;
  final double currentMovement;
  final Duration elapsed;

  const SleepTrackingData({
    this.state = TrackingState.idle,
    this.startTime,
    this.movementEvents = 0,
    this.interruptions = 0,
    this.currentMovement = 0.0,
    this.elapsed = Duration.zero,
  });

  SleepTrackingData copyWith({
    TrackingState? state,
    DateTime? startTime,
    int? movementEvents,
    int? interruptions,
    double? currentMovement,
    Duration? elapsed,
  }) {
    return SleepTrackingData(
      state: state ?? this.state,
      startTime: startTime ?? this.startTime,
      movementEvents: movementEvents ?? this.movementEvents,
      interruptions: interruptions ?? this.interruptions,
      currentMovement: currentMovement ?? this.currentMovement,
      elapsed: elapsed ?? this.elapsed,
    );
  }
}

class SleepTrackingService extends StateNotifier<SleepTrackingData> {
  SleepTrackingService(this._repository) : super(const SleepTrackingData());

  final SleepSessionRepository _repository;
  StreamSubscription<AccelerometerEvent>? _accelSub;
  Timer? _elapsedTimer;
  Timer? _movementResetTimer;

  // Movement tracking
  double _lastX = 0, _lastY = 0, _lastZ = 0;
  bool _isFirstReading = true;
  static const double _movementThreshold = 0.8;
  static const double _interruptionThreshold = 2.5;
  int _highMovementCount = 0;

  void startTracking() {
    if (state.state == TrackingState.tracking) return;

    final startTime = DateTime.now();
    state = state.copyWith(
      state: TrackingState.tracking,
      startTime: startTime,
      movementEvents: 0,
      interruptions: 0,
    );

    _startAccelerometer();
    _startElapsedTimer(startTime);
  }

  void stopTracking() {
    _accelSub?.cancel();
    _elapsedTimer?.cancel();
    _movementResetTimer?.cancel();
    state = state.copyWith(state: TrackingState.stopped);
  }

  Future<SleepSessionModel?> finishAndSave() async {
    if (state.startTime == null) return null;

    final endTime = DateTime.now();
    final session = _buildSession(endTime);
    await _repository.saveSession(session);

    state = const SleepTrackingData();
    return session;
  }

  void reset() {
    stopTracking();
    state = const SleepTrackingData();
  }

  void _startAccelerometer() {
    _accelSub = accelerometerEventStream(
      samplingPeriod: const Duration(milliseconds: 1000),
    ).listen(_onAccelerometer);
  }

  void _onAccelerometer(AccelerometerEvent event) {
    if (_isFirstReading) {
      _lastX = event.x;
      _lastY = event.y;
      _lastZ = event.z;
      _isFirstReading = false;
      return;
    }

    final delta = sqrt(
      pow(event.x - _lastX, 2) +
          pow(event.y - _lastY, 2) +
          pow(event.z - _lastZ, 2),
    );

    _lastX = event.x;
    _lastY = event.y;
    _lastZ = event.z;

    if (delta > _movementThreshold) {
      _highMovementCount++;
      int interruptions = state.interruptions;

      if (delta > _interruptionThreshold) {
        interruptions++;
      }

      state = state.copyWith(
        movementEvents: state.movementEvents + 1,
        interruptions: interruptions,
        currentMovement: min(delta / 5.0, 1.0),
      );
    } else {
      state = state.copyWith(
          currentMovement: max(state.currentMovement - 0.1, 0.0));
    }
  }

  void _startElapsedTimer(DateTime startTime) {
    _elapsedTimer = Timer.periodic(const Duration(seconds: 1), (_) {
      state = state.copyWith(
        elapsed: DateTime.now().difference(startTime),
      );
    });
  }

  SleepSessionModel _buildSession(DateTime endTime) {
    final startTime = state.startTime!;
    final durationHours = endTime.difference(startTime).inMinutes / 60.0;
    final movementScore = _calculateMovementScore();
    final score =
        _calculateSleepScore(durationHours, movementScore, state.interruptions);
    final stages = _estimateSleepStages(durationHours, movementScore);

    return SleepSessionModel()
      ..sleepTime = startTime
      ..wakeTime = endTime
      ..sleepScore = score
      ..interruptions = state.interruptions
      ..movementScore = movementScore
      ..durationHours = durationHours
      ..estimatedLightSleep = stages['light']!
      ..estimatedDeepSleep = stages['deep']!
      ..estimatedRemSleep = stages['rem']!
      ..estimatedAwakeTime = stages['awake']!
      ..snoreDetected = false
      ..snoreEventCount = 0
      ..avgNoiseLevel = 0.0
      ..metSleepGoal = durationHours >= 7.0
      ..consistencyScore = _calculateConsistencyScore(startTime, endTime);
  }

  double _calculateMovementScore() {
    if (state.elapsed.inMinutes == 0) return 0.5;
    final eventsPerHour = state.movementEvents / (state.elapsed.inMinutes / 60);
    return (eventsPerHour / 100).clamp(0.0, 1.0);
  }

  int _calculateSleepScore(
      double durationHours, double movementScore, int interruptions) {
    // Duration score (0-40 pts)
    double durationScore = 0;
    if (durationHours >= 7 && durationHours <= 9) {
      durationScore = 40;
    } else if (durationHours >= 6) {
      durationScore = 30;
    } else if (durationHours >= 5) {
      durationScore = 20;
    } else {
      durationScore = 10;
    }

    // Movement score (0-30 pts)
    final movementPoints = ((1.0 - movementScore) * 30).clamp(0.0, 30.0);

    // Interruption score (0-30 pts)
    double interruptionScore = 30;
    if (interruptions > 0) {
      interruptionScore = max(0, 30 - (interruptions * 5));
    }

    return (durationScore + movementPoints + interruptionScore)
        .round()
        .clamp(0, 100);
  }

  Map<String, int> _estimateSleepStages(
      double durationHours, double movementScore) {
    final totalMinutes = (durationHours * 60).round();

    // Rough heuristic-based stage estimation
    final deepPercent = (0.20 - movementScore * 0.10).clamp(0.10, 0.25);
    const remPercent = 0.20;
    final awakePercent = (movementScore * 0.10).clamp(0.02, 0.15);
    final lightPercent = 1.0 - deepPercent - remPercent - awakePercent;

    return {
      'light': (totalMinutes * lightPercent).round(),
      'deep': (totalMinutes * deepPercent).round(),
      'rem': (totalMinutes * remPercent).round(),
      'awake': (totalMinutes * awakePercent).round(),
    };
  }

  int _calculateConsistencyScore(DateTime sleepTime, DateTime wakeTime) {
    // Compare to target bedtime (22:30) and wake (06:30) — simplified
    const targetBedHour = 22;
    const targetWakeHour = 6;

    final bedDiff = (sleepTime.hour - targetBedHour).abs();
    final wakeDiff = (wakeTime.hour - targetWakeHour).abs();

    final bedScore = max(0, 50 - bedDiff * 10);
    final wakeScore = max(0, 50 - wakeDiff * 10);

    return (bedScore + wakeScore).clamp(0, 100);
  }

  @override
  void dispose() {
    stopTracking();
    super.dispose();
  }
}

final sleepTrackingServiceProvider =
    StateNotifierProvider<SleepTrackingService, SleepTrackingData>((ref) {
  return SleepTrackingService(SleepSessionRepository());
});
