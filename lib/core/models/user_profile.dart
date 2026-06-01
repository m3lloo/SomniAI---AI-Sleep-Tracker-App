class UserProfile {
  final String id;
  final int? age;
  final double? sleepGoal; // in hours
  final String? wakeUpTime; // HH:mm format
  final String? bedtimeReminder; // HH:mm format
  final bool darkModeEnabled;
  final String? geminiApiKey;
  final DateTime createdAt;
  final DateTime? lastUpdated;

  UserProfile({
    required this.id,
    this.age,
    this.sleepGoal = 8.0,
    this.wakeUpTime = '07:00',
    this.bedtimeReminder = '23:00',
    this.darkModeEnabled = true,
    this.geminiApiKey,
    required this.createdAt,
    this.lastUpdated,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      id: json['id'],
      age: json['age'],
      sleepGoal: (json['sleepGoal'] as num?)?.toDouble() ?? 8.0,
      wakeUpTime: json['wakeUpTime'],
      bedtimeReminder: json['bedtimeReminder'],
      darkModeEnabled: json['darkModeEnabled'] ?? true,
      geminiApiKey: json['geminiApiKey'],
      createdAt: DateTime.parse(json['createdAt']),
      lastUpdated:
          json['lastUpdated'] != null ? DateTime.parse(json['lastUpdated']) : null,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'age': age,
        'sleepGoal': sleepGoal,
        'wakeUpTime': wakeUpTime,
        'bedtimeReminder': bedtimeReminder,
        'darkModeEnabled': darkModeEnabled,
        'geminiApiKey': geminiApiKey,
        'createdAt': createdAt.toIso8601String(),
        'lastUpdated': lastUpdated?.toIso8601String(),
      };

  UserProfile copyWith({
    String? id,
    int? age,
    double? sleepGoal,
    String? wakeUpTime,
    String? bedtimeReminder,
    bool? darkModeEnabled,
    String? geminiApiKey,
    DateTime? createdAt,
    DateTime? lastUpdated,
  }) {
    return UserProfile(
      id: id ?? this.id,
      age: age ?? this.age,
      sleepGoal: sleepGoal ?? this.sleepGoal,
      wakeUpTime: wakeUpTime ?? this.wakeUpTime,
      bedtimeReminder: bedtimeReminder ?? this.bedtimeReminder,
      darkModeEnabled: darkModeEnabled ?? this.darkModeEnabled,
      geminiApiKey: geminiApiKey ?? this.geminiApiKey,
      createdAt: createdAt ?? this.createdAt,
      lastUpdated: lastUpdated ?? this.lastUpdated,
    );
  }
}
