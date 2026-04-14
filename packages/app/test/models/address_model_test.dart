import 'package:flutter_test/flutter_test.dart';
import 'package:app/src/models/address_model.dart';

void main() {
  group('AddressModel', () {
    test('should create from json', () {
      final json = <String, dynamic>{
        'id': 'address_006',
        'name': 'Test Address',
        'email': 'test@example.com',
        'age': 30,
        'isActive': true,
      };
      final model = AddressModel.fromJson(json);
      expect(model.id, 'address_006');
      expect(model.name, 'Test Address');
      expect(model.email, 'test@example.com');
      expect(model.age, 30);
      expect(model.isActive, true);
    });
    test('should convert to json', () {
      final model = AddressModel(
        id: 'address_006',
        name: 'Test Address',
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
      final model = AddressModel(
        id: 'address_006',
        name: 'Test Address',
        email: 'test@example.com',
        age: 30,
        isActive: true,
      );
      final copy = model.copyWith();
      expect(copy, model);
    });
    test('supports equality', () {
      final a = AddressModel(
        id: 'address_006',
        name: 'Test Address',
        email: 'test@example.com',
        age: 30,
        isActive: true,
      );
      final b = AddressModel(
        id: 'address_006',
        name: 'Test Address',
        email: 'test@example.com',
        age: 30,
        isActive: true,
      );
      expect(a, b);
    });
  });
}
