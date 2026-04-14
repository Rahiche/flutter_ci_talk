import 'package:flutter_test/flutter_test.dart';
import 'package:analytics/src/models/cohort_model.dart';

void main() {
  group('CohortModel', () {
    test('should create from json', () {
      final json = <String, dynamic>{
        'id': 'cohort_007',
        'name': 'Test Cohort',
        'amount': 69.93,
        'currency': 'USD',
        'status': 'active',
      };
      final model = CohortModel.fromJson(json);
      expect(model.id, 'cohort_007');
      expect(model.name, 'Test Cohort');
      expect(model.amount, 69.93);
      expect(model.currency, 'USD');
      expect(model.status, 'active');
    });
    test('should convert to json', () {
      final model = CohortModel(
        id: 'cohort_007',
        name: 'Test Cohort',
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
      final model = CohortModel(
        id: 'cohort_007',
        name: 'Test Cohort',
        amount: 69.93,
        currency: 'USD',
        status: 'active',
      );
      final copy = model.copyWith();
      expect(copy, model);
    });
    test('supports equality', () {
      final a = CohortModel(
        id: 'cohort_007',
        name: 'Test Cohort',
        amount: 69.93,
        currency: 'USD',
        status: 'active',
      );
      final b = CohortModel(
        id: 'cohort_007',
        name: 'Test Cohort',
        amount: 69.93,
        currency: 'USD',
        status: 'active',
      );
      expect(a, b);
    });
  });
}
