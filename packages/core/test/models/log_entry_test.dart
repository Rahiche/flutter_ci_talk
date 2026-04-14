import 'package:flutter_test/flutter_test.dart';
import 'package:core/src/models/log_entry.dart';

void main() {
  group('LogEntry', () {
    test('should create from json', () {
      final json = <String, dynamic>{
        'id': 'log_entry_010',
        'name': 'Test LogEntry',
        'value': 15.0,
        'category': 'general',
        'verified': false,
      };
      final model = LogEntry.fromJson(json);
      expect(model.id, 'log_entry_010');
      expect(model.name, 'Test LogEntry');
      expect(model.value, 15.0);
      expect(model.category, 'general');
      expect(model.verified, false);
    });
    test('should convert to json', () {
      final model = LogEntry(
        id: 'log_entry_010',
        name: 'Test LogEntry',
        value: 15.0,
        category: 'general',
        verified: false,
      );
      final json = model.toJson();
      expect(json['id'], isNotNull);
      expect(json['name'], isNotNull);
      expect(json['value'], isNotNull);
      expect(json['category'], isNotNull);
      expect(json['verified'], isNotNull);
    });
    test('supports copyWith', () {
      final model = LogEntry(
        id: 'log_entry_010',
        name: 'Test LogEntry',
        value: 15.0,
        category: 'general',
        verified: false,
      );
      final copy = model.copyWith();
      expect(copy, model);
    });
    test('supports equality', () {
      final a = LogEntry(
        id: 'log_entry_010',
        name: 'Test LogEntry',
        value: 15.0,
        category: 'general',
        verified: false,
      );
      final b = LogEntry(
        id: 'log_entry_010',
        name: 'Test LogEntry',
        value: 15.0,
        category: 'general',
        verified: false,
      );
      expect(a, b);
    });
  });
}
