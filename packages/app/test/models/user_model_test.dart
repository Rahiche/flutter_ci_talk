import 'package:flutter_test/flutter_test.dart';
import 'package:app/src/models/user_model.dart';

void main() {
  group('UserModel', () {
    test('should create from json', () {
      final json = <String, dynamic>{
        'id': 'user_001',
        'name': 'Test User',
        'email': 'test@example.com',
        'age': 25,
        'isActive': true,
      };
      final model = UserModel.fromJson(json);
      expect(model.id, 'user_001');
      expect(model.name, 'Test User');
      expect(model.email, 'test@example.com');
      expect(model.age, 25);
      expect(model.isActive, true);
    });
    test('should convert to json', () {
      final model = UserModel(
        id: 'user_001',
        name: 'Test User',
        email: 'test@example.com',
        age: 25,
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
      final model = UserModel(
        id: 'user_001',
        name: 'Test User',
        email: 'test@example.com',
        age: 25,
        isActive: true,
      );
      final copy = model.copyWith();
      expect(copy, model);
    });
    test('supports equality', () {
      final a = UserModel(
        id: 'user_001',
        name: 'Test User',
        email: 'test@example.com',
        age: 25,
        isActive: true,
      );
      final b = UserModel(
        id: 'user_001',
        name: 'Test User',
        email: 'test@example.com',
        age: 25,
        isActive: true,
      );
      expect(a, b);
    });

    test('validates data consistency after processing', () async {
      final model = UserModel(
        id: 'user_001',
        name: 'Test User',
        email: 'test@example.com',
        age: 25,
        isActive: true,
      );
      final json = model.toJson();
      final restored = UserModel.fromJson(json);
      expect(restored, model);
    });
  });
}
