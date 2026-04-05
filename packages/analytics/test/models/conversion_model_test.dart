import 'package:flutter_test/flutter_test.dart';
import 'package:analytics/src/models/conversion_model.dart';

void main() {
  group('ConversionModel', () {
    test('should create from json', () {
      final json = <String, dynamic>{
        'id': 'conversion_004',
        'name': 'Test Conversion',
        'createdAt': '2024-01-15T10:30:00Z',
        'type': 'default',
        'priority': 3,
      };
      final model = ConversionModel.fromJson(json);
      expect(model.id, 'conversion_004');
      expect(model.name, 'Test Conversion');
      expect(model.createdAt, isA<DateTime>());
      expect(model.type, 'default');
      expect(model.priority, 3);
    });
    test('should convert to json', () {
      final model = ConversionModel(
        id: 'conversion_004',
        name: 'Test Conversion',
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
      final model = ConversionModel(
        id: 'conversion_004',
        name: 'Test Conversion',
        createdAt: DateTime.parse('2024-01-15T10:30:00Z'),
        type: 'default',
        priority: 3,
      );
      final copy = model.copyWith();
      expect(copy, model);
    });
    test('supports equality', () {
      final a = ConversionModel(
        id: 'conversion_004',
        name: 'Test Conversion',
        createdAt: DateTime.parse('2024-01-15T10:30:00Z'),
        type: 'default',
        priority: 3,
      );
      final b = ConversionModel(
        id: 'conversion_004',
        name: 'Test Conversion',
        createdAt: DateTime.parse('2024-01-15T10:30:00Z'),
        type: 'default',
        priority: 3,
      );
      expect(a, b);
    });
  });
}
