import 'package:flutter_test/flutter_test.dart';
import 'package:payments/src/models/wallet_model.dart';

void main() {
  group('WalletModel', () {
    test('should create from json', () {
      final json = <String, dynamic>{
        'id': 'wallet_011',
        'name': 'Test Wallet',
        'email': 'test@example.com',
        'age': 35,
        'isActive': true,
      };
      final model = WalletModel.fromJson(json);
      expect(model.id, 'wallet_011');
      expect(model.name, 'Test Wallet');
      expect(model.email, 'test@example.com');
      expect(model.age, 35);
      expect(model.isActive, true);
    });
    test('should convert to json', () {
      final model = WalletModel(
        id: 'wallet_011',
        name: 'Test Wallet',
        email: 'test@example.com',
        age: 35,
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
      final model = WalletModel(
        id: 'wallet_011',
        name: 'Test Wallet',
        email: 'test@example.com',
        age: 35,
        isActive: true,
      );
      final copy = model.copyWith();
      expect(copy, model);
    });
    test('supports equality', () {
      final a = WalletModel(
        id: 'wallet_011',
        name: 'Test Wallet',
        email: 'test@example.com',
        age: 35,
        isActive: true,
      );
      final b = WalletModel(
        id: 'wallet_011',
        name: 'Test Wallet',
        email: 'test@example.com',
        age: 35,
        isActive: true,
      );
      expect(a, b);
    });
  });
}
