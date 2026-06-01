// lib/features/sleep_tracking/data/repositories/sleep_session_repository.dart
import 'package:isar/isar.dart';
import '../../../../local_database/isar_service.dart';
import '../../../../local_database/models/sleep_session_model.dart';

class SleepSessionRepository {
  Future<Isar> get _db => IsarService.instance;

  Future<int> saveSession(SleepSessionModel session) async {
    final db = await _db;
    return await db.writeTxn(() async {
      return await db.sleepSessionModels.put(session);
    });
  }

  Future<List<SleepSessionModel>> getAllSessions() async {
    final db = await _db;
    return await db.sleepSessionModels.where().sortBySleepTimeDesc().findAll();
  }

  Future<List<SleepSessionModel>> getSessionsForRange(
    DateTime start,
    DateTime end,
  ) async {
    final db = await _db;
    return await db.sleepSessionModels
        .filter()
        .sleepTimeBetween(start, end)
        .sortBySleepTimeDesc()
        .findAll();
  }

  Future<SleepSessionModel?> getLastSession() async {
    final db = await _db;
    return await db.sleepSessionModels.where().sortBySleepTimeDesc().findFirst();
  }

  Future<SleepSessionModel?> getSessionById(int id) async {
    final db = await _db;
    return await db.sleepSessionModels.get(id);
  }

  Future<void> deleteSession(int id) async {
    final db = await _db;
    await db.writeTxn(() async {
      await db.sleepSessionModels.delete(id);
    });
  }

  /// Returns sessions for the last N days
  Future<List<SleepSessionModel>> getRecentSessions(int days) async {
    try {
      final start = DateTime.now().subtract(Duration(days: days));
      final end = DateTime.now().add(const Duration(days: 1));
      return await getSessionsForRange(start, end);
    } catch (e) {
      rethrow;
    }
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

  Stream<List<SleepSessionModel>> watchAllSessions() async* {
    final db = await _db;
    yield* db.sleepSessionModels.where().sortBySleepTimeDesc().watch(fireImmediately: true);
  }

  /// Calculate consecutive days streak of sleep logging
  Future<int> calculateStreak() async {
    try {
      final sessions = await getRecentSessions(365); // Check last year
      if (sessions.isEmpty) return 0;

      // Get unique dates with logs
      final datesWithLogs = <DateTime>{};
      for (var session in sessions) {
        datesWithLogs.add(DateTime(
          session.sleepTime.year,
          session.sleepTime.month,
          session.sleepTime.day,
        ));
      }

      if (datesWithLogs.isEmpty) return 0;

      // Sort dates in descending order (most recent first)
      final sortedDates = datesWithLogs.toList()..sort((a, b) => b.compareTo(a));

      // Calculate streak from today backwards
      int streak = 0;
      DateTime currentCheck = DateTime.now();
      currentCheck = DateTime(currentCheck.year, currentCheck.month, currentCheck.day);

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
