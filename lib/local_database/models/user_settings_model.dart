// lib/local_database/models/user_settings_model.dart
import 'package:isar/isar.dart';

part 'user_settings_model.g.dart';

@collection
class UserSettingsModel {
  Id id = 1; // singleton

  bool darkMode = true;
  bool aiModeEnabled = false;
  bool microphoneEnabled = false;
  bool smartAlarmEnabled = true;
  bool bedtimeReminderEnabled = true;
  bool snoreDetectionEnabled = false;
  double sleepGoalHours = 8.0;
  int bedtimeHour = 22;
  int bedtimeMinute = 30;
  int wakeHour = 6;
  int wakeMinute = 30;
  int smartAlarmWindowMinutes = 30;
  String? claudeApiKey;
  String? openAiApiKey;
  String preferredAiProvider = 'claude'; // 'claude' | 'openai'
}


// lib/local_database/models/alarm_model.dart
// (kept in same file for simplicity — split as needed)