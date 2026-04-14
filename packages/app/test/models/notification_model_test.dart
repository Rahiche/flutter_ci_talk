import 'package:flutter_test/flutter_test.dart';
import 'package:app/src/models/notification_model.dart';

void main() {
  group('NotificationModel', () {
    test('should create from json', () {
      final json = <String, dynamic>{
        'id': 'notification_004',
        'name': 'Test Notification',
        'createdAt': '2024-01-15T10:30:00Z',
        'type': 'default',
        'priority': 3,
      };
      final model = NotificationModel.fromJson(json);
      expect(model.id, 'notification_004');
      expect(model.name, 'Test Notification');
      expect(model.createdAt, isA<DateTime>());
      expect(model.type, 'default');
      expect(model.priority, 3);
    });
    test('should convert to json', () {
      final model = NotificationModel(
        id: 'notification_004',
        name: 'Test Notification',
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
      final model = NotificationModel(
        id: 'notification_004',
        name: 'Test Notification',
        createdAt: DateTime.parse('2024-01-15T10:30:00Z'),
        type: 'default',
        priority: 3,
      );
      final copy = model.copyWith();
      expect(copy, model);
    });
    test('supports equality', () {
      final a = NotificationModel(
        id: 'notification_004',
        name: 'Test Notification',
        createdAt: DateTime.parse('2024-01-15T10:30:00Z'),
        type: 'default',
        priority: 3,
      );
      final b = NotificationModel(
        id: 'notification_004',
        name: 'Test Notification',
        createdAt: DateTime.parse('2024-01-15T10:30:00Z'),
        type: 'default',
        priority: 3,
      );
      expect(a, b);
    });
  });
}
