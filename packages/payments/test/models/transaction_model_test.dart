import 'package:flutter_test/flutter_test.dart';
import 'package:payments/src/models/transaction_model.dart';

void main() {
  group('TransactionModel', () {
    test('should create from json', () {
      final json = <String, dynamic>{
        'id': 'transaction_002',
        'name': 'Test Transaction',
        'amount': 19.98,
        'currency': 'USD',
        'status': 'active',
      };
      final model = TransactionModel.fromJson(json);
      expect(model.id, 'transaction_002');
      expect(model.name, 'Test Transaction');
      expect(model.amount, 19.98);
      expect(model.currency, 'USD');
      expect(model.status, 'active');
    });
    test('should convert to json', () {
      final model = TransactionModel(
        id: 'transaction_002',
        name: 'Test Transaction',
        amount: 19.98,
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
      final model = TransactionModel(
        id: 'transaction_002',
        name: 'Test Transaction',
        amount: 19.98,
        currency: 'USD',
        status: 'active',
      );
      final copy = model.copyWith();
      expect(copy, model);
    });
    test('supports equality', () {
      final a = TransactionModel(
        id: 'transaction_002',
        name: 'Test Transaction',
        amount: 19.98,
        currency: 'USD',
        status: 'active',
      );
      final b = TransactionModel(
        id: 'transaction_002',
        name: 'Test Transaction',
        amount: 19.98,
        currency: 'USD',
        status: 'active',
      );
      expect(a, b);
    });
  });
}
