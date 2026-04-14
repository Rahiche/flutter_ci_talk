import 'package:flutter_test/flutter_test.dart';
import 'package:analytics/src/models/session_data_model.dart';

void main() {
  group('SessionDataModel', () {
    test('should create from json', () {
      final json = <String, dynamic>{
        'id': 'session_data_003',
        'name': 'Test SessionData',
        'count': 12,
        'enabled': true,
        'description': 'A SessionData item',
      };
      final model = SessionDataModel.fromJson(json);
      expect(model.id, 'session_data_003');
      expect(model.name, 'Test SessionData');
      expect(model.count, 12);
      expect(model.enabled, true);
      expect(model.description, 'A SessionData item');
    });
    test('should convert to json', () {
      final model = SessionDataModel(
        id: 'session_data_003',
        name: 'Test SessionData',
        count: 12,
        enabled: true,
        description: 'A SessionData item',
      );
      final json = model.toJson();
      expect(json['id'], isNotNull);
      expect(json['name'], isNotNull);
      expect(json['count'], isNotNull);
      expect(json['enabled'], isNotNull);
      expect(json['description'], isNotNull);
    });
    test('supports copyWith', () {
      final model = SessionDataModel(
        id: 'session_data_003',
        name: 'Test SessionData',
        count: 12,
        enabled: true,
        description: 'A SessionData item',
      );
      final copy = model.copyWith();
      expect(copy, model);
    });
    test('supports equality', () {
      final a = SessionDataModel(
        id: 'session_data_003',
        name: 'Test SessionData',
        count: 12,
        enabled: true,
        description: 'A SessionData item',
      );
      final b = SessionDataModel(
        id: 'session_data_003',
        name: 'Test SessionData',
        count: 12,
        enabled: true,
        description: 'A SessionData item',
      );
      expect(a, b);
    });
  });
}
