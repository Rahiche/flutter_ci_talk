import 'package:flutter_test/flutter_test.dart';
import 'package:app/src/models/profile_model.dart';

void main() {
  group('ProfileModel', () {
    test('should create from json', () {
      final json = <String, dynamic>{
        'id': 'profile_002',
        'name': 'Test Profile',
        'amount': 19.98,
        'currency': 'USD',
        'status': 'active',
      };
      final model = ProfileModel.fromJson(json);
      expect(model.id, 'profile_002');
      expect(model.name, 'Test Profile');
      expect(model.amount, 19.98);
      expect(model.currency, 'USD');
      expect(model.status, 'active');
    });
    test('should convert to json', () {
      final model = ProfileModel(
        id: 'profile_002',
        name: 'Test Profile',
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
      final model = ProfileModel(
        id: 'profile_002',
        name: 'Test Profile',
        amount: 19.98,
        currency: 'USD',
        status: 'active',
      );
      final copy = model.copyWith();
      expect(copy, model);
    });
    test('supports equality', () {
      final a = ProfileModel(
        id: 'profile_002',
        name: 'Test Profile',
        amount: 19.98,
        currency: 'USD',
        status: 'active',
      );
      final b = ProfileModel(
        id: 'profile_002',
        name: 'Test Profile',
        amount: 19.98,
        currency: 'USD',
        status: 'active',
      );
      expect(a, b);
    });
  });
}
