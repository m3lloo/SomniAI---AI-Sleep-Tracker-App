// lib/local_database/models/models.dart
// Drift data models with helper methods and backward compatibility

import 'package:somni_ai/local_database/database/app_database.dart';

// Re-export Drift-generated data classes
export 'package:somni_ai/local_database/database/app_database.dart'
    show
        SleepSession,
        JournalEntry,
        UserSetting,
        SleepSessionsCompanion,
        JournalEntriesCompanion,
        UserSettingsCompanion;

// Type aliases for backward compatibility
typedef SleepSessionModel = SleepSession;
typedef JournalEntryModel = JournalEntry;
typedef UserSettingsModel = UserSetting;

/// Extension methods for SleepSession to provide helper getters
extension SleepSessionExt on SleepSession {
  /// Formatted duration string (e.g., "7h 30m")
  String get durationFormatted {
    final h = durationHours.floor();
    final m = ((durationHours - h) * 60).round();
    return '${h}h ${m}m';
  }

  /// Label for sleep score (Excellent, Good, Fair, Poor)
  String get scoreLabel {
    if (sleepScore >= 90) return 'Excellent';
    if (sleepScore >= 70) return 'Good';
    if (sleepScore >= 50) return 'Fair';
    return 'Poor';
  }

  /// Date of the sleep session (without time)
  DateTime get date => DateTime(sleepTime.year, sleepTime.month, sleepTime.day);
}

/// Extension methods for JournalEntry
extension JournalEntryExt on JournalEntry {
  /// Formatted creation date
  String get formattedDate =>
      '${createdAt.day}/${createdAt.month}/${createdAt.year}';
}

/// Extension methods for UserSetting
extension UserSettingExt on UserSetting {
  /// Formatted bedtime (e.g., "22:30")
  String get formattedBedtime =>
      '$bedtimeHour:${bedtimeMinute.toString().padLeft(2, '0')}';

  /// Formatted wake time (e.g., "06:30")
  String get formattedWakeTime =>
      '$wakeHour:${wakeMinute.toString().padLeft(2, '0')}';
}
