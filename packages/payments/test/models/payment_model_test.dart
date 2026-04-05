import 'package:flutter_test/flutter_test.dart';
import 'package:payments/src/models/payment_model.dart';

void main() {
  group('PaymentModel', () {
    test('should create from json', () {
      final json = <String, dynamic>{
        'id': 'payment_001',
        'name': 'Test Payment',
        'email': 'test@example.com',
        'age': 25,
        'isActive': true,
      };
      final model = PaymentModel.fromJson(json);
      expect(model.id, 'payment_001');
      expect(model.name, 'Test Payment');
      expect(model.email, 'test@example.com');
      expect(model.age, 25);
      expect(model.isActive, true);
    });
    test('should convert to json', () {
      final model = PaymentModel(
        id: 'payment_001',
        name: 'Test Payment',
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
      final model = PaymentModel(
        id: 'payment_001',
        name: 'Test Payment',
        email: 'test@example.com',
        age: 25,
        isActive: true,
      );
      final copy = model.copyWith();
      expect(copy, model);
    });
    test('supports equality', () {
      final a = PaymentModel(
        id: 'payment_001',
        name: 'Test Payment',
        email: 'test@example.com',
        age: 25,
        isActive: true,
      );
      final b = PaymentModel(
        id: 'payment_001',
        name: 'Test Payment',
        email: 'test@example.com',
        age: 25,
        isActive: true,
      );
      expect(a, b);
    });

    test('validates data consistency after processing', () async {
      final model = PaymentModel(
        id: 'payment_001',
        name: 'Test Payment',
        email: 'test@example.com',
        age: 25,
        isActive: true,
      );
      // delay removed
      final json = model.toJson();
      final restored = PaymentModel.fromJson(json);
      expect(restored, model);
    });
  });
}
