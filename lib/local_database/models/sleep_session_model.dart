// lib/local_database/models/sleep_session_model.dart
import 'package:isar/isar.dart';

part 'sleep_session_model.g.dart';

@collection
class SleepSessionModel {
  Id id = Isar.autoIncrement;

  @Index()
  late DateTime sleepTime;

  late DateTime wakeTime;

  late int sleepScore; // 0-100
  late int interruptions; // number of wake events
  late double movementScore; // 0.0-1.0 (lower = less movement = better)
  late double durationHours;

  // Sleep stage estimates (minutes)
  late int estimatedLightSleep;
  late int estimatedDeepSleep;
  late int estimatedRemSleep;
  late int estimatedAwakeTime;

  // Snore detection
  late bool snoreDetected;
  late int snoreEventCount;

  // Environmental
  late double avgNoiseLevel; // dB

  // Consistency
  late bool metSleepGoal;
  late int consistencyScore; // 0-100

  // Notes
  String? notes;

  // Computed getters
  String get durationFormatted {
    final h = durationHours.floor();
    final m = ((durationHours - h) * 60).round();
    return '${h}h ${m}m';
  }

  String get scoreLabel {
    if (sleepScore >= 90) return 'Excellent';
    if (sleepScore >= 70) return 'Good';
    if (sleepScore >= 50) return 'Fair';
    return 'Poor';
  }

  DateTime get date => DateTime(sleepTime.year, sleepTime.month, sleepTime.day);
}
