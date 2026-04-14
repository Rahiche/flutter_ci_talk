import 'package:flutter_test/flutter_test.dart';
import 'package:payments/src/models/subscription_model.dart';

void main() {
  group('SubscriptionModel', () {
    test('should create from json', () {
      final json = <String, dynamic>{
        'id': 'subscription_007',
        'name': 'Test Subscription',
        'amount': 69.93,
        'currency': 'USD',
        'status': 'active',
      };
      final model = SubscriptionModel.fromJson(json);
      expect(model.id, 'subscription_007');
      expect(model.name, 'Test Subscription');
      expect(model.amount, 69.93);
      expect(model.currency, 'USD');
      expect(model.status, 'active');
    });
    test('should convert to json', () {
      final model = SubscriptionModel(
        id: 'subscription_007',
        name: 'Test Subscription',
        amount: 69.93,
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
      final model = SubscriptionModel(
        id: 'subscription_007',
        name: 'Test Subscription',
        amount: 69.93,
        currency: 'USD',
        status: 'active',
      );
      final copy = model.copyWith();
      expect(copy, model);
    });
    test('supports equality', () {
      final a = SubscriptionModel(
        id: 'subscription_007',
        name: 'Test Subscription',
        amount: 69.93,
        currency: 'USD',
        status: 'active',
      );
      final b = SubscriptionModel(
        id: 'subscription_007',
        name: 'Test Subscription',
        amount: 69.93,
        currency: 'USD',
        status: 'active',
      );
      expect(a, b);
    });
  });
}
