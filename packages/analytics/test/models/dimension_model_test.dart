import 'package:flutter_test/flutter_test.dart';
import 'package:analytics/src/models/dimension_model.dart';

void main() {
  group('DimensionModel', () {
    test('should create from json', () {
      final json = <String, dynamic>{
        'id': 'dimension_009',
        'name': 'Test Dimension',
        'createdAt': '2024-01-15T10:30:00Z',
        'type': 'default',
        'priority': 3,
      };
      final model = DimensionModel.fromJson(json);
      expect(model.id, 'dimension_009');
      expect(model.name, 'Test Dimension');
      expect(model.createdAt, isA<DateTime>());
      expect(model.type, 'default');
      expect(model.priority, 3);
    });
    test('should convert to json', () {
      final model = DimensionModel(
        id: 'dimension_009',
        name: 'Test Dimension',
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
      final model = DimensionModel(
        id: 'dimension_009',
        name: 'Test Dimension',
        createdAt: DateTime.parse('2024-01-15T10:30:00Z'),
        type: 'default',
        priority: 3,
      );
      final copy = model.copyWith();
      expect(copy, model);
    });
    test('supports equality', () {
      final a = DimensionModel(
        id: 'dimension_009',
        name: 'Test Dimension',
        createdAt: DateTime.parse('2024-01-15T10:30:00Z'),
        type: 'default',
        priority: 3,
      );
      final b = DimensionModel(
        id: 'dimension_009',
        name: 'Test Dimension',
        createdAt: DateTime.parse('2024-01-15T10:30:00Z'),
        type: 'default',
        priority: 3,
      );
      expect(a, b);
    });

    test('validates data consistency after processing', () async {
      final model = DimensionModel(
        id: 'dimension_009',
        name: 'Test Dimension',
        createdAt: DateTime.parse('2024-01-15T10:30:00Z'),
        type: 'default',
        priority: 3,
      );
      await Future.delayed(const Duration(seconds: 2));
      final json = model.toJson();
      final restored = DimensionModel.fromJson(json);
      expect(restored, model);
    });
  });
}
