import 'package:csv/csv.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('CSV conversion produces expected header and rows', () {
    final rows = [
      ['id', 'sleepTime', 'wakeTime'],
      [1, '2026-06-01T23:00:00', '2026-06-02T07:30:00'],
    ];

    final csv = const ListToCsvConverter().convert(rows);
    expect(csv.contains('id,sleepTime,wakeTime'), isTrue);
    expect(csv.contains('1,2026-06-01T23:00:00,2026-06-02T07:30:00'), isTrue);
  });
}
