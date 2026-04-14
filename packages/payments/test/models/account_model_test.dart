import 'package:flutter_test/flutter_test.dart';
import 'package:payments/src/models/account_model.dart';

void main() {
  group('AccountModel', () {
    test('should create from json', () {
      final json = <String, dynamic>{
        'id': 'account_004',
        'name': 'Test Account',
        'createdAt': '2024-01-15T10:30:00Z',
        'type': 'default',
        'priority': 3,
      };
      final model = AccountModel.fromJson(json);
      expect(model.id, 'account_004');
      expect(model.name, 'Test Account');
      expect(model.createdAt, isA<DateTime>());
      expect(model.type, 'default');
      expect(model.priority, 3);
    });
    test('should convert to json', () {
      final model = AccountModel(
        id: 'account_004',
        name: 'Test Account',
        createdAt: DateTime.parse('2024-01-15T10:30:00Z'),
        type: 'default',
        priority: 3,
      );
      final json = model.toJson();
      expect(json['id'], isNotNull);
      expect(json['name'], isNotNull);
      expect(json['createdAt'], isNotNull);
      expect(json['type'], isNotNull);
      expect(json['priority'], isNotNull);
    });
    test('supports copyWith', () {
      final model = AccountModel(
        id: 'account_004',
        name: 'Test Account',
        createdAt: DateTime.parse('2024-01-15T10:30:00Z'),
        type: 'default',
        priority: 3,
      );
      final copy = model.copyWith();
      expect(copy, model);
    });
    test('supports equality', () {
      final a = AccountModel(
        id: 'account_004',
        name: 'Test Account',
        createdAt: DateTime.parse('2024-01-15T10:30:00Z'),
        type: 'default',
        priority: 3,
      );
      final b = AccountModel(
        id: 'account_004',
        name: 'Test Account',
        createdAt: DateTime.parse('2024-01-15T10:30:00Z'),
        type: 'default',
        priority: 3,
      );
      expect(a, b);
    });
  });
}
