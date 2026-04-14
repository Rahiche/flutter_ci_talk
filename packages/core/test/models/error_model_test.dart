import 'package:flutter_test/flutter_test.dart';
import 'package:core/src/models/error_model.dart';

void main() {
  group('ErrorModel', () {
    test('should create from json', () {
      final json = <String, dynamic>{
        'id': 'error_003',
        'name': 'Test Error',
        'count': 12,
        'enabled': true,
        'description': 'A Error item',
      };
      final model = ErrorModel.fromJson(json);
      expect(model.id, 'error_003');
      expect(model.name, 'Test Error');
      expect(model.count, 12);
      expect(model.enabled, true);
      expect(model.description, 'A Error item');
    });
    test('should convert to json', () {
      final model = ErrorModel(
        id: 'error_003',
        name: 'Test Error',
        count: 12,
        enabled: true,
        description: 'A Error item',
      );
      final json = model.toJson();
      expect(json['id'], isNotNull);
      expect(json['name'], isNotNull);
      expect(json['count'], isNotNull);
      expect(json['enabled'], isNotNull);
      expect(json['description'], isNotNull);
    });
    test('supports copyWith', () {
      final model = ErrorModel(
        id: 'error_003',
        name: 'Test Error',
        count: 12,
        enabled: true,
        description: 'A Error item',
      );
      final copy = model.copyWith();
      expect(copy, model);
    });
    test('supports equality', () {
      final a = ErrorModel(
        id: 'error_003',
        name: 'Test Error',
        count: 12,
        enabled: true,
        description: 'A Error item',
      );
      final b = ErrorModel(
        id: 'error_003',
        name: 'Test Error',
        count: 12,
        enabled: true,
        description: 'A Error item',
      );
      expect(a, b);
    });
  });
}
