// lib/features/journal/data/repositories/journal_repository.dart
import 'package:somni_ai/local_database/database/database_service.dart';
import 'package:somni_ai/local_database/models/models.dart';

// Re-export for convenience
export 'package:somni_ai/local_database/models/models.dart';

class JournalRepository {
  late final JournalEntryDao _dao;

  JournalRepository() {
    _dao = JournalEntryDao(DatabaseService().database);
  }

  Future<int> saveEntry(JournalEntriesCompanion entry) async {
    return await _dao.saveEntry(entry);
  }

  Future<List<JournalEntryModel>> getAllEntries() async {
    final entries = await _dao.getAllEntries();
    return entries;
  }

  Future<void> deleteEntry(int id) async {
    await _dao.deleteEntry(id);
  }

  Stream<List<JournalEntryModel>> watchEntries() {
    return _dao.watchEntries();
  }
}
