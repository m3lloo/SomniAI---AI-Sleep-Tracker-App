// lib/local_database/database/database_service.dart
import 'package:drift/drift.dart';
import 'app_database.dart';

/// Database service that provides a unified interface for database operations.
/// This replaces the old IsarService with Drift (SQLite) implementation.
class DatabaseService {
  static final DatabaseService _instance = DatabaseService._internal();
  factory DatabaseService() => _instance;
  DatabaseService._internal();

  AppDatabase get database => AppDatabase.instance;

  /// Initialize the database (called automatically on first access)
  Future<void> init() async {
    // Database is lazily initialized on first access
    // No action needed as it's already initialized
  }

  /// Close the database connection
  Future<void> close() async {
    await database.close();
  }
}

/// DAO for Sleep Sessions
class SleepSessionDao {
  final AppDatabase _db;

  SleepSessionDao(this._db);

  /// Get all sleep sessions ordered by sleep time (newest first)
  Future<List<SleepSession>> getAllSessions() async {
    return await (_db.select(_db.sleepSessions)
          ..orderBy([(t) => OrderingTerm.desc(t.sleepTime)]))
        .get();
  }

  /// Get sessions within a date range
  Future<List<SleepSession>> getSessionsForRange(
    DateTime start,
    DateTime end,
  ) async {
    return await (_db.select(_db.sleepSessions)
          ..where((t) => t.sleepTime.isBetweenValues(start, end))
          ..orderBy([(t) => OrderingTerm.desc(t.sleepTime)]))
        .get();
  }

  /// Get the most recent sleep session
  Future<SleepSession?> getLastSession() async {
    return await (_db.select(_db.sleepSessions)
          ..orderBy([(t) => OrderingTerm.desc(t.sleepTime)])
          ..limit(1))
        .getSingleOrNull();
  }

  /// Get a session by ID
  Future<SleepSession?> getSessionById(int id) async {
    return await (_db.select(_db.sleepSessions)..where((t) => t.id.equals(id)))
        .getSingleOrNull();
  }

  /// Save or update a sleep session
  Future<int> saveSession(SleepSessionsCompanion session) async {
    // Always insert as new (id is auto-generated)
    return await _db.into(_db.sleepSessions).insert(session);
  }

  /// Delete a session by ID
  Future<void> deleteSession(int id) async {
    await (_db.delete(_db.sleepSessions)..where((t) => t.id.equals(id))).go();
  }

  /// Get sessions for the last N days
  Future<List<SleepSession>> getRecentSessions(int days) async {
    final now = DateTime.now();
    final start = now.subtract(Duration(days: days));
    final end = now.add(const Duration(days: 1));
    return await getSessionsForRange(start, end);
  }

  /// Compute weekly average sleep score
  Future<double> getWeeklyAverageScore() async {
    final sessions = await getRecentSessions(7);
    if (sessions.isEmpty) return 0;
    final total = sessions.fold(0, (sum, s) => sum + s.sleepScore);
    return total / sessions.length;
  }

  /// Compute average sleep duration (hours) for last N days
  Future<double> getAverageDuration(int days) async {
    final sessions = await getRecentSessions(days);
    if (sessions.isEmpty) return 0;
    final total = sessions.fold(0.0, (sum, s) => sum + s.durationHours);
    return total / sessions.length;
  }

  /// Watch all sessions for changes (stream)
  Stream<List<SleepSession>> watchAllSessions() {
    return (_db.select(_db.sleepSessions)
          ..orderBy([(t) => OrderingTerm.desc(t.sleepTime)]))
        .watch();
  }

  /// Calculate consecutive days streak of sleep logging
  Future<int> calculateStreak() async {
    try {
      final sessions = await getRecentSessions(365);
      if (sessions.isEmpty) return 0;

      // Get unique dates with logs
      final datesWithLogs = <DateTime>{};
      for (final session in sessions) {
        datesWithLogs.add(DateTime(
          session.sleepTime.year,
          session.sleepTime.month,
          session.sleepTime.day,
        ));
      }

      if (datesWithLogs.isEmpty) return 0;

      // Sort dates in descending order (most recent first)
      final sortedDates = datesWithLogs.toList()
        ..sort((a, b) => b.compareTo(a));

      // Calculate streak from today backwards
      int streak = 0;
      DateTime currentCheck = DateTime.now();
      currentCheck =
          DateTime(currentCheck.year, currentCheck.month, currentCheck.day);

      for (final date in sortedDates) {
        if (date == currentCheck) {
          streak++;
          currentCheck = currentCheck.subtract(const Duration(days: 1));
        } else if (date == currentCheck.subtract(const Duration(days: 1))) {
          streak++;
          currentCheck = currentCheck.subtract(const Duration(days: 1));
        } else {
          break; // Streak broken
        }
      }

      return streak;
    } catch (e) {
      return 0;
    }
  }
}

/// DAO for Journal Entries
class JournalEntryDao {
  final AppDatabase _db;

  JournalEntryDao(this._db);

  /// Get all journal entries ordered by creation date (newest first)
  Future<List<JournalEntry>> getAllEntries() async {
    return await (_db.select(_db.journalEntries)
          ..orderBy([(t) => OrderingTerm.desc(t.createdAt)]))
        .get();
  }

  /// Save or update a journal entry
  Future<int> saveEntry(JournalEntriesCompanion entry) async {
    // Always insert as new (id is auto-generated)
    return await _db.into(_db.journalEntries).insert(entry);
  }

  /// Delete an entry by ID
  Future<void> deleteEntry(int id) async {
    await (_db.delete(_db.journalEntries)..where((t) => t.id.equals(id))).go();
  }

  /// Watch entries for changes (stream)
  Stream<List<JournalEntry>> watchEntries() {
    return (_db.select(_db.journalEntries)
          ..orderBy([(t) => OrderingTerm.desc(t.createdAt)]))
        .watch();
  }
}

/// DAO for User Settings
class UserSettingsDao {
  final AppDatabase _db;

  UserSettingsDao(this._db);

  /// Get user settings (singleton with id=1)
  Future<UserSetting?> getSettings() async {
    return await (_db.select(_db.userSettings)..where((t) => t.id.equals(1)))
        .getSingleOrNull();
  }

  /// Save or update user settings
  Future<void> saveSettings(UserSettingsCompanion settings) async {
    // Always use id=1 for singleton
    final existing = await getSettings();
    if (existing != null) {
      await (_db.update(_db.userSettings)..where((t) => t.id.equals(1)))
          .write(settings);
    } else {
      await _db.into(_db.userSettings).insert(
            settings.copyWith(id: const Value(1)),
          );
    }
  }

  /// Watch settings for changes (stream)
  Stream<UserSetting?> watchSettings() {
    return (_db.select(_db.userSettings)..where((t) => t.id.equals(1)))
        .watchSingleOrNull();
  }
}
