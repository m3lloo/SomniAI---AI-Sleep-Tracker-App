// lib/features/sleep_tracking/data/repositories/sleep_session_repository.dart
import 'package:somni_ai/local_database/database/database_service.dart';
import 'package:somni_ai/local_database/models/models.dart';

// Re-export for convenience
export 'package:somni_ai/local_database/models/models.dart';

class SleepSessionRepository {
  late final SleepSessionDao _dao;

  SleepSessionRepository() {
    _dao = SleepSessionDao(DatabaseService().database);
  }

  Future<int> saveSession(SleepSessionsCompanion session) async {
    return await _dao.saveSession(session);
  }

  Future<List<SleepSessionModel>> getAllSessions() async {
    final sessions = await _dao.getAllSessions();
    return sessions;
  }

  Future<List<SleepSessionModel>> getSessionsForRange(
    DateTime start,
    DateTime end,
  ) async {
    return await _dao.getSessionsForRange(start, end);
  }

  Future<SleepSessionModel?> getLastSession() async {
    return await _dao.getLastSession();
  }

  Future<SleepSessionModel?> getSessionById(int id) async {
    return await _dao.getSessionById(id);
  }

  Future<void> deleteSession(int id) async {
    await _dao.deleteSession(id);
  }

  Future<void> updateSessionTimes(int id, DateTime sleepTime, DateTime wakeTime) async {
    await _dao.updateSessionTimes(id, sleepTime, wakeTime);
  }

  /// Returns sessions for the last N days
  Future<List<SleepSessionModel>> getRecentSessions(int days) async {
    try {
      return await _dao.getRecentSessions(days);
    } catch (e) {
      rethrow;
    }
  }

  /// Compute weekly average sleep score
  Future<double> getWeeklyAverageScore() async {
    return await _dao.getWeeklyAverageScore();
  }

  /// Compute average sleep duration (hours) for last N days
  Future<double> getAverageDuration(int days) async {
    return await _dao.getAverageDuration(days);
  }

  Stream<List<SleepSessionModel>> watchAllSessions() {
    return _dao.watchAllSessions();
  }

  /// Calculate consecutive days streak of sleep logging
  Future<int> calculateStreak() async {
    return await _dao.calculateStreak();
  }
}
