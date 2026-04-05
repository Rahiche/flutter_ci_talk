import 'package:flutter_test/flutter_test.dart';
import 'package:core/src/models/theme_config.dart';

void main() {
  group('ThemeConfig', () {
    test('should create from json', () {
      final json = <String, dynamic>{
        'id': 'theme_config_004',
        'name': 'Test ThemeConfig',
        'createdAt': '2024-01-15T10:30:00Z',
        'type': 'default',
        'priority': 3,
      };
      final model = ThemeConfig.fromJson(json);
      expect(model.id, 'theme_config_004');
      expect(model.name, 'Test ThemeConfig');
      expect(model.createdAt, isA<DateTime>());
      expect(model.type, 'default');
      expect(model.priority, 3);
    });
    test('should convert to json', () {
      final model = ThemeConfig(
        id: 'theme_config_004',
        name: 'Test ThemeConfig',
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
      final model = ThemeConfig(
        id: 'theme_config_004',
        name: 'Test ThemeConfig',
        createdAt: DateTime.parse('2024-01-15T10:30:00Z'),
        type: 'default',
        priority: 3,
      );
      final copy = model.copyWith();
      expect(copy, model);
    });
    test('supports equality', () {
      final a = ThemeConfig(
        id: 'theme_config_004',
        name: 'Test ThemeConfig',
        createdAt: DateTime.parse('2024-01-15T10:30:00Z'),
        type: 'default',
        priority: 3,
      );
      final b = ThemeConfig(
        id: 'theme_config_004',
        name: 'Test ThemeConfig',
        createdAt: DateTime.parse('2024-01-15T10:30:00Z'),
        type: 'default',
        priority: 3,
      );
      expect(a, b);
    });
  });
}
