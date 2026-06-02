import 'dart:io';
import 'package:csv/csv.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import '../repositories/sleep_session_repository.dart';

class ExportUtil {
  static Future<String?> exportSleepDataCsv() async {
    final repo = SleepSessionRepository();
    final sessions = await repo.getAllSessions();
    if (sessions.isEmpty) return null;

    final rows = <List<dynamic>>[];
    rows.add([
      'id',
      'sleepTime',
      'wakeTime',
      'durationHours',
      'sleepScore',
      'interruptions',
      'estimatedLightSleep',
      'estimatedDeepSleep',
      'estimatedRemSleep',
      'estimatedAwakeTime',
    ]);

    for (final s in sessions) {
      rows.add([
        s.id,
        s.sleepTime.toIso8601String(),
        s.wakeTime.toIso8601String(),
        s.durationHours,
        s.sleepScore,
        s.interruptions,
        s.estimatedLightSleep,
        s.estimatedDeepSleep,
        s.estimatedRemSleep,
        s.estimatedAwakeTime,
      ]);
    }

    final csv = const ListToCsvConverter().convert(rows);
    final dir = await getTemporaryDirectory();
    final file = File(
        '${dir.path}/somni_sleep_export_${DateTime.now().toIso8601String()}.csv');
    await file.writeAsString(csv);
    return file.path;
  }

  static Future<void> exportAndShare() async {
    final path = await exportSleepDataCsv();
    if (path == null) return;
    await Share.shareXFiles([XFile(path)], text: 'SomniAI sleep export');
  }
}
