// ignore_for_file: avoid_redundant_argument_values

import 'package:flutter_test/flutter_test.dart';
import 'package:somni_ai/local_database/models/models.dart';

void main() {
  group('Analytics calculations', () {
    test('average score and duration', () {
      final sessions = [
        SleepSession(
          id: 1,
          sleepTime: DateTime(2026, 6, 1, 23, 0),
          wakeTime: DateTime(2026, 6, 2, 7, 30),
          sleepScore: 80,
          interruptions: 1,
          movementScore: 0.3,
          durationHours: 8.5,
          estimatedLightSleep: 240,
          estimatedDeepSleep: 120,
          estimatedRemSleep: 90,
          estimatedAwakeTime: 30,
          snoreDetected: false,
          snoreEventCount: 0,
          avgNoiseLevel: 30.0,
          metSleepGoal: true,
          consistencyScore: 85,
          notes: null,
        ),
        SleepSession(
          id: 2,
          sleepTime: DateTime(2026, 6, 2, 23, 30),
          wakeTime: DateTime(2026, 6, 3, 6, 45),
          sleepScore: 70,
          interruptions: 2,
          movementScore: 0.5,
          durationHours: 7.25,
          estimatedLightSleep: 200,
          estimatedDeepSleep: 100,
          estimatedRemSleep: 80,
          estimatedAwakeTime: 35,
          snoreDetected: true,
          snoreEventCount: 3,
          avgNoiseLevel: 40.0,
          metSleepGoal: false,
          consistencyScore: 70,
          notes: null,
        ),
      ];

      final avgScore =
          sessions.fold(0, (s, e) => s + e.sleepScore) / sessions.length;
      final avgDuration =
          sessions.fold(0.0, (s, e) => s + e.durationHours) / sessions.length;

      expect(avgScore, equals((80 + 70) / 2));
      expect(avgDuration, equals((8.5 + 7.25) / 2));
    });
  });
}
