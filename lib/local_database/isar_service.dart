// lib/local_database/isar_service.dart
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'models/sleep_session_model.dart';
import 'models/journal_entry_model.dart';
import 'models/user_settings_model.dart';

class IsarService {
  static Isar? _isar;

  static Future<Isar> get instance async {
    _isar ??= await _init();
    return _isar!;
  }

  static Future<Isar> _init() async {
    final dir = await getApplicationDocumentsDirectory();
    return await Isar.open(
      [
        SleepSessionModelSchema,
        JournalEntryModelSchema,
        UserSettingsModelSchema,
      ],
      directory: dir.path,
      name: 'somniai_db',
    );
  }

  static Future<void> close() async {
    await _isar?.close();
    _isar = null;
  }
}
