// lib/local_database/database/app_database.dart
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'app_database.g.dart';

// Table Definitions

class SleepSessions extends Table {
  IntColumn get id => integer().autoIncrement()();

  DateTimeColumn get sleepTime => dateTime()();

  DateTimeColumn get wakeTime => dateTime()();

  IntColumn get sleepScore => integer()(); // 0-100
  IntColumn get interruptions => integer()(); // number of wake events
  RealColumn get movementScore =>
      real()(); // 0.0-1.0 (lower = less movement = better)
  RealColumn get durationHours => real()();

  // Sleep stage estimates (minutes)
  IntColumn get estimatedLightSleep => integer()();
  IntColumn get estimatedDeepSleep => integer()();
  IntColumn get estimatedRemSleep => integer()();
  IntColumn get estimatedAwakeTime => integer()();

  // Snore detection
  BoolColumn get snoreDetected => boolean()();
  IntColumn get snoreEventCount => integer()();

  // Environmental
  RealColumn get avgNoiseLevel => real()(); // dB

  // Consistency
  BoolColumn get metSleepGoal => boolean()();
  IntColumn get consistencyScore => integer()(); // 0-100

  // Notes
  TextColumn? get notes => text().nullable()();
}

class JournalEntries extends Table {
  IntColumn get id => integer().autoIncrement()();

  DateTimeColumn get createdAt => dateTime()();

  TextColumn get mood => text()();
  IntColumn get stressLevel => integer()(); // 1-5
  IntColumn get energyLevel => integer()(); // 1-5
  TextColumn? get dreamNotes => text().nullable()();
  TextColumn? get generalNotes => text().nullable()();

  // Linked sleep session
  IntColumn? get linkedSessionId => integer().nullable()();
}

class UserSettings extends Table {
  IntColumn get id => integer()(); // singleton, always 1

  BoolColumn get darkMode => boolean()();
  BoolColumn get aiModeEnabled => boolean()();
  BoolColumn get microphoneEnabled => boolean()();
  BoolColumn get smartAlarmEnabled => boolean()();
  BoolColumn get bedtimeReminderEnabled => boolean()();
  BoolColumn get snoreDetectionEnabled => boolean()();
  RealColumn get sleepGoalHours => real()();
  IntColumn get bedtimeHour => integer()();
  IntColumn get bedtimeMinute => integer()();
  IntColumn get wakeHour => integer()();
  IntColumn get wakeMinute => integer()();
  IntColumn get smartAlarmWindowMinutes => integer()();
  TextColumn? get claudeApiKey => text().nullable()();
  TextColumn? get openAiApiKey => text().nullable()();
  TextColumn get preferredAiProvider => text()(); // 'claude' | 'openai'

  @override
  Set<Column> get primaryKey => {id};
}

// Database class

@DriftDatabase(tables: [SleepSessions, JournalEntries, UserSettings])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  // Singleton pattern
  static final AppDatabase _instance = AppDatabase();
  static AppDatabase get instance => _instance;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'somniai_db.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
