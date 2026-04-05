import 'package:flutter_test/flutter_test.dart';
import 'package:core/src/models/app_config.dart';

void main() {
  group('AppConfig', () {
    test('should create from json', () {
      final json = <String, dynamic>{
        'id': 'app_config_005',
        'name': 'Test AppConfig',
        'value': 7.5,
        'category': 'general',
        'verified': false,
      };
      final model = AppConfig.fromJson(json);
      expect(model.id, 'app_config_005');
      expect(model.name, 'Test AppConfig');
      expect(model.value, 7.5);
      expect(model.category, 'general');
      expect(model.verified, false);
    });
    test('should convert to json', () {
      final model = AppConfig(
        id: 'app_config_005',
        name: 'Test AppConfig',
        value: 7.5,
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
      final model = AppConfig(
        id: 'app_config_005',
        name: 'Test AppConfig',
        value: 7.5,
        category: 'general',
        verified: false,
      );
      final copy = model.copyWith();
      expect(copy, model);
    });
    test('supports equality', () {
      final a = AppConfig(
        id: 'app_config_005',
        name: 'Test AppConfig',
        value: 7.5,
        category: 'general',
        verified: false,
      );
      final b = AppConfig(
        id: 'app_config_005',
        name: 'Test AppConfig',
        value: 7.5,
        category: 'general',
        verified: false,
      );
      expect(a, b);
    });

    test('validates data consistency after processing', () async {
      final model = AppConfig(
        id: 'app_config_005',
        name: 'Test AppConfig',
        value: 7.5,
        category: 'general',
        verified: false,
      );
      final json = model.toJson();
      final restored = AppConfig.fromJson(json);
      expect(restored, model);
    });
  });
}
