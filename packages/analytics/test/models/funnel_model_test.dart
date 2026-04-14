import 'package:flutter_test/flutter_test.dart';
import 'package:analytics/src/models/funnel_model.dart';

void main() {
  group('FunnelModel', () {
    test('should create from json', () {
      final json = <String, dynamic>{
        'id': 'funnel_006',
        'name': 'Test Funnel',
        'email': 'test@example.com',
        'age': 30,
        'isActive': true,
      };
      final model = FunnelModel.fromJson(json);
      expect(model.id, 'funnel_006');
      expect(model.name, 'Test Funnel');
      expect(model.email, 'test@example.com');
      expect(model.age, 30);
      expect(model.isActive, true);
    });
    test('should convert to json', () {
      final model = FunnelModel(
        id: 'funnel_006',
        name: 'Test Funnel',
        email: 'test@example.com',
        age: 30,
        isActive: true,
      );
      final json = model.toJson();
      expect(json['id'], isNotNull);
      expect(json['name'], isNotNull);
      expect(json['email'], isNotNull);
      expect(json['age'], isNotNull);
      expect(json['isActive'], isNotNull);
    });
    test('supports copyWith', () {
      final model = FunnelModel(
        id: 'funnel_006',
        name: 'Test Funnel',
        email: 'test@example.com',
        age: 30,
        isActive: true,
      );
      final copy = model.copyWith();
      expect(copy, model);
    });
    test('supports equality', () {
      final a = FunnelModel(
        id: 'funnel_006',
        name: 'Test Funnel',
        email: 'test@example.com',
        age: 30,
        isActive: true,
      );
      final b = FunnelModel(
        id: 'funnel_006',
        name: 'Test Funnel',
        email: 'test@example.com',
        age: 30,
        isActive: true,
      );
      expect(a, b);
    });
  });
}
