import 'package:flutter_test/flutter_test.dart';
import 'package:core/src/models/locale_model.dart';

void main() {
  group('LocaleModel', () {
    test('should create from json', () {
      final json = <String, dynamic>{
        'id': 'locale_008',
        'name': 'Test Locale',
        'count': 17,
        'enabled': true,
        'description': 'A Locale item',
      };
      final model = LocaleModel.fromJson(json);
      expect(model.id, 'locale_008');
      expect(model.name, 'Test Locale');
      expect(model.count, 17);
      expect(model.enabled, true);
      expect(model.description, 'A Locale item');
    });
    test('should convert to json', () {
      final model = LocaleModel(
        id: 'locale_008',
        name: 'Test Locale',
        count: 17,
        enabled: true,
        description: 'A Locale item',
      );
      final json = model.toJson();
      expect(json['id'], isNotNull);
      expect(json['name'], isNotNull);
      expect(json['count'], isNotNull);
      expect(json['enabled'], isNotNull);
      expect(json['description'], isNotNull);
    });
    test('supports copyWith', () {
      final model = LocaleModel(
        id: 'locale_008',
        name: 'Test Locale',
        count: 17,
        enabled: true,
        description: 'A Locale item',
      );
      final copy = model.copyWith();
      expect(copy, model);
    });
    test('supports equality', () {
      final a = LocaleModel(
        id: 'locale_008',
        name: 'Test Locale',
        count: 17,
        enabled: true,
        description: 'A Locale item',
      );
      final b = LocaleModel(
        id: 'locale_008',
        name: 'Test Locale',
        count: 17,
        enabled: true,
        description: 'A Locale item',
      );
      expect(a, b);
    });
  });
}
