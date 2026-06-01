// lib/core/constants/app_constants.dart

class AppConstants {
  // App Info
  static const String appName = 'SomniAI';
  static const String appVersion = '1.0.0';

  // Database
  static const String isarDbName = 'somniai_db';
  static const int isarDbVersion = 1;

  // SharedPreferences Keys
  static const String keyDarkMode = 'dark_mode';
  static const String keyAiModeEnabled = 'ai_mode_enabled';
  static const String keyMicEnabled = 'mic_enabled';
  static const String keyOnboardingDone = 'onboarding_done';
  static const String keySleepGoalHours = 'sleep_goal_hours';
  static const String keyBedtimeHour = 'bedtime_hour';
  static const String keyBedtimeMinute = 'bedtime_minute';
  static const String keyWakeHour = 'wake_hour';
  static const String keyWakeMinute = 'wake_minute';
  static const String keyAlarmSet = 'alarm_set';
  static const String keyClaudeApiKey = 'claude_api_key';
  static const String keyOpenAiApiKey = 'openai_api_key';

  // Sleep Score Thresholds
  static const int scoreExcellent = 90;
  static const int scoreGood = 70;
  static const int scoreFair = 50;

  // Default Values
  static const double defaultSleepGoalHours = 8.0;
  static const int defaultBedtimeHour = 22;
  static const int defaultBedtimeMinute = 30;
  static const int defaultWakeHour = 6;
  static const int defaultWakeMinute = 30;

  // Smart Alarm
  static const int smartAlarmWindowMinutes = 30;

  // Tracking
  static const int sensorSamplingRateMs = 1000;
  static const int audioSamplingWindowSec = 10;

  // AI
  static const String claudeApiUrl = 'https://api.anthropic.com/v1/messages';
  static const String claudeModel = 'claude-opus-4-5';
  static const int aiMaxTokens = 1024;

  // Notification IDs
  static const int notifBedtimeReminder = 1001;
  static const int notifWakeAlarm = 1002;
  static const int notifSleepGoal = 1003;
  static const int notifRelaxation = 1004;

  // Mood Options
  static const List<String> moodOptions = [
    '😴 Exhausted',
    '😔 Tired',
    '😐 Neutral',
    '😊 Refreshed',
    '🌟 Energized',
  ];

  // Stress Levels
  static const List<String> stressLevels = [
    'Very Low',
    'Low',
    'Moderate',
    'High',
    'Very High',
  ];
}

class SleepStage {
  static const String awake = 'Awake';
  static const String light = 'Light Sleep';
  static const String deep = 'Deep Sleep';
  static const String rem = 'REM Sleep';
}
