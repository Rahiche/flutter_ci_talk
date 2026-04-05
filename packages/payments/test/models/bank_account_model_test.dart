import 'package:flutter_test/flutter_test.dart';
import 'package:payments/src/models/bank_account_model.dart';

void main() {
  group('BankAccountModel', () {
    test('should create from json', () {
      final json = <String, dynamic>{
        'id': 'bank_account_012',
        'name': 'Test BankAccount',
        'amount': 119.88,
        'currency': 'USD',
        'status': 'active',
      };
      final model = BankAccountModel.fromJson(json);
      expect(model.id, 'bank_account_012');
      expect(model.name, 'Test BankAccount');
      expect(model.amount, 119.88);
      expect(model.currency, 'USD');
      expect(model.status, 'active');
    });
    test('should convert to json', () {
      final model = BankAccountModel(
        id: 'bank_account_012',
        name: 'Test BankAccount',
        amount: 119.88,
        currency: 'USD',
        status: 'active',
      );
      final json = model.toJson();
      expect(json['id'], isNotNull);
      expect(json['name'], isNotNull);
      expect(json['amount'], isNotNull);
      expect(json['currency'], isNotNull);
      expect(json['status'], isNotNull);
    });
    test('supports copyWith', () {
      final model = BankAccountModel(
        id: 'bank_account_012',
        name: 'Test BankAccount',
        amount: 119.88,
        currency: 'USD',
        status: 'active',
      );
      final copy = model.copyWith();
      expect(copy, model);
    });
    test('supports equality', () {
      final a = BankAccountModel(
        id: 'bank_account_012',
        name: 'Test BankAccount',
        amount: 119.88,
        currency: 'USD',
        status: 'active',
      );
      final b = BankAccountModel(
        id: 'bank_account_012',
        name: 'Test BankAccount',
        amount: 119.88,
        currency: 'USD',
        status: 'active',
      );
      expect(a, b);
    });
  });
}
