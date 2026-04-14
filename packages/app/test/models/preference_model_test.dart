import 'package:flutter_test/flutter_test.dart';
import 'package:app/src/models/preference_model.dart';

void main() {
  group('PreferenceModel', () {
    test('should create from json', () {
      final json = <String, dynamic>{
        'id': 'preference_007',
        'name': 'Test Preference',
        'amount': 69.93,
        'currency': 'USD',
        'status': 'active',
      };
      final model = PreferenceModel.fromJson(json);
      expect(model.id, 'preference_007');
      expect(model.name, 'Test Preference');
      expect(model.amount, 69.93);
      expect(model.currency, 'USD');
      expect(model.status, 'active');
    });
    test('should convert to json', () {
      final model = PreferenceModel(
        id: 'preference_007',
        name: 'Test Preference',
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
      final model = PreferenceModel(
        id: 'preference_007',
        name: 'Test Preference',
        amount: 69.93,
        currency: 'USD',
        status: 'active',
      );
      final copy = model.copyWith();
      expect(copy, model);
    });
    test('supports equality', () {
      final a = PreferenceModel(
        id: 'preference_007',
        name: 'Test Preference',
        amount: 69.93,
        currency: 'USD',
        status: 'active',
      );
      final b = PreferenceModel(
        id: 'preference_007',
        name: 'Test Preference',
        amount: 69.93,
        currency: 'USD',
        status: 'active',
      );
      expect(a, b);
    });
  });
}
