// lib/features/journal/data/repositories/journal_repository.dart
import 'package:isar/isar.dart';
import '../../../../local_database/isar_service.dart';
import '../../../../local_database/models/journal_entry_model.dart';

class JournalRepository {
  Future<Isar> get _db => IsarService.instance;

  Future<int> saveEntry(JournalEntryModel entry) async {
    final db = await _db;
    return await db.writeTxn(() async {
      return await db.journalEntryModels.put(entry);
    });
  }

  Future<List<JournalEntryModel>> getAllEntries() async {
    final db = await _db;
    return await db.journalEntryModels.where().sortByCreatedAtDesc().findAll();
  }

  Future<void> deleteEntry(int id) async {
    final db = await _db;
    await db.writeTxn(() async {
      await db.journalEntryModels.delete(id);
    });
  }

  Stream<List<JournalEntryModel>> watchEntries() async* {
    final db = await _db;
    yield* db.journalEntryModels.where().sortByCreatedAtDesc().watch(fireImmediately: true);
  }
}
