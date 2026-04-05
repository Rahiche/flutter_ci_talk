import 'package:flutter_test/flutter_test.dart';
import 'package:app/src/models/settings_model.dart';

void main() {
  group('SettingsModel', () {
    test('should create from json', () {
      final json = <String, dynamic>{
        'id': 'settings_003',
        'name': 'Test Settings',
        'count': 12,
        'enabled': true,
        'description': 'A Settings item',
      };
      final model = SettingsModel.fromJson(json);
      expect(model.id, 'settings_003');
      expect(model.name, 'Test Settings');
      expect(model.count, 12);
      expect(model.enabled, true);
      expect(model.description, 'A Settings item');
    });
    test('should convert to json', () {
      final model = SettingsModel(
        id: 'settings_003',
        name: 'Test Settings',
        count: 12,
        enabled: true,
        description: 'A Settings item',
      );
      final json = model.toJson();
      expect(json['id'], isNotNull);
      expect(json['name'], isNotNull);
      expect(json['count'], isNotNull);
      expect(json['enabled'], isNotNull);
      expect(json['description'], isNotNull);
    });
    test('supports copyWith', () {
      final model = SettingsModel(
        id: 'settings_003',
        name: 'Test Settings',
        count: 12,
        enabled: true,
        description: 'A Settings item',
      );
      final copy = model.copyWith();
      expect(copy, model);
    });
    test('supports equality', () {
      final a = SettingsModel(
        id: 'settings_003',
        name: 'Test Settings',
        count: 12,
        enabled: true,
        description: 'A Settings item',
      );
      final b = SettingsModel(
        id: 'settings_003',
        name: 'Test Settings',
        count: 12,
        enabled: true,
        description: 'A Settings item',
      );
      expect(a, b);
    });
  });
}
