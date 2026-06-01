// lib/local_database/models/journal_entry_model.dart
import 'package:isar/isar.dart';

part 'journal_entry_model.g.dart';

@collection
class JournalEntryModel {
  Id id = Isar.autoIncrement;

  @Index()
  late DateTime createdAt;

  late String mood;
  late int stressLevel; // 1-5
  late int energyLevel; // 1-5
  String? dreamNotes;
  String? generalNotes;

  // Linked sleep session
  int? linkedSessionId;
}
