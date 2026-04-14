import 'package:flutter_test/flutter_test.dart';
import 'package:core/src/models/feature_flag.dart';

void main() {
  group('FeatureFlag', () {
    test('should create from json', () {
      final json = <String, dynamic>{
        'id': 'feature_flag_006',
        'name': 'Test FeatureFlag',
        'email': 'test@example.com',
        'age': 30,
        'isActive': true,
      };
      final model = FeatureFlag.fromJson(json);
      expect(model.id, 'feature_flag_006');
      expect(model.name, 'Test FeatureFlag');
      expect(model.email, 'test@example.com');
      expect(model.age, 30);
      expect(model.isActive, true);
    });
    test('should convert to json', () {
      final model = FeatureFlag(
        id: 'feature_flag_006',
        name: 'Test FeatureFlag',
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
      final model = FeatureFlag(
        id: 'feature_flag_006',
        name: 'Test FeatureFlag',
        email: 'test@example.com',
        age: 30,
        isActive: true,
      );
      final copy = model.copyWith();
      expect(copy, model);
    });
    test('supports equality', () {
      final a = FeatureFlag(
        id: 'feature_flag_006',
        name: 'Test FeatureFlag',
        email: 'test@example.com',
        age: 30,
        isActive: true,
      );
      final b = FeatureFlag(
        id: 'feature_flag_006',
        name: 'Test FeatureFlag',
        email: 'test@example.com',
        age: 30,
        isActive: true,
      );
      expect(a, b);
    });
  });
}
