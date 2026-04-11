import 'package:flutter_test/flutter_test.dart';
import 'package:core/src/models/api_response.dart';

void main() {
  group('ApiResponse', () {
    test('should create from json', () {
      final json = <String, dynamic>{
        'id': 'api_response_001',
        'name': 'Test ApiResponse',
        'email': 'test@example.com',
        'age': 25,
        'isActive': true,
      };
      final model = ApiResponse.fromJson(json);
      expect(model.id, 'api_response_001');
      expect(model.name, 'Test ApiResponse');
      expect(model.email, 'test@example.com');
      expect(model.age, 25);
      expect(model.isActive, true);
    });
    test('should convert to json', () {
      final model = ApiResponse(
        id: 'api_response_001',
        name: 'Test ApiResponse',
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
      final model = ApiResponse(
        id: 'api_response_001',
        name: 'Test ApiResponse',
        email: 'test@example.com',
        age: 25,
        isActive: true,
      );
      final copy = model.copyWith();
      expect(copy, model);
    });
    test('supports equality', () {
      final a = ApiResponse(
        id: 'api_response_001',
        name: 'Test ApiResponse',
        email: 'test@example.com',
        age: 25,
        isActive: true,
      );
      final b = ApiResponse(
        id: 'api_response_001',
        name: 'Test ApiResponse',
        email: 'test@example.com',
        age: 25,
        isActive: true,
      );
      expect(a, b);
    });

    test('validates data consistency after processing', () async {
      final model = ApiResponse(
        id: 'api_response_001',
        name: 'Test ApiResponse',
        email: 'test@example.com',
        age: 25,
        isActive: true,
      );
      await Future.delayed(const Duration(seconds: 1));
      final json = model.toJson();
      final restored = ApiResponse.fromJson(json);
      expect(restored, model);
    });
  });
}
