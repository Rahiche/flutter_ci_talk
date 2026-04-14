import 'package:flutter_test/flutter_test.dart';
import 'package:app/src/models/device_model.dart';

void main() {
  group('DeviceModel', () {
    test('should create from json', () {
      final json = <String, dynamic>{
        'id': 'device_008',
        'name': 'Test Device',
        'count': 17,
        'enabled': true,
        'description': 'A Device item',
      };
      final model = DeviceModel.fromJson(json);
      expect(model.id, 'device_008');
      expect(model.name, 'Test Device');
      expect(model.count, 17);
      expect(model.enabled, true);
      expect(model.description, 'A Device item');
    });
    test('should convert to json', () {
      final model = DeviceModel(
        id: 'device_008',
        name: 'Test Device',
        count: 17,
        enabled: true,
        description: 'A Device item',
      );
      final json = model.toJson();
      expect(json['id'], isNotNull);
      expect(json['name'], isNotNull);
      expect(json['count'], isNotNull);
      expect(json['enabled'], isNotNull);
      expect(json['description'], isNotNull);
    });
    test('supports copyWith', () {
      final model = DeviceModel(
        id: 'device_008',
        name: 'Test Device',
        count: 17,
        enabled: true,
        description: 'A Device item',
      );
      final copy = model.copyWith();
      expect(copy, model);
    });
    test('supports equality', () {
      final a = DeviceModel(
        id: 'device_008',
        name: 'Test Device',
        count: 17,
        enabled: true,
        description: 'A Device item',
      );
      final b = DeviceModel(
        id: 'device_008',
        name: 'Test Device',
        count: 17,
        enabled: true,
        description: 'A Device item',
      );
      expect(a, b);
    });
  });
}
