import 'package:flutter_test/flutter_test.dart';
import 'package:analytics/src/models/metric_model.dart';

void main() {
  group('MetricModel', () {
    test('should create from json', () {
      final json = <String, dynamic>{
        'id': 'metric_002',
        'name': 'Test Metric',
        'amount': 19.98,
        'currency': 'USD',
        'status': 'active',
      };
      final model = MetricModel.fromJson(json);
      expect(model.id, 'metric_002');
      expect(model.name, 'Test Metric');
      expect(model.amount, 19.98);
      expect(model.currency, 'USD');
      expect(model.status, 'active');
    });
    test('should convert to json', () {
      final model = MetricModel(
        id: 'metric_002',
        name: 'Test Metric',
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
      final model = MetricModel(
        id: 'metric_002',
        name: 'Test Metric',
        amount: 19.98,
        currency: 'USD',
        status: 'active',
      );
      final copy = model.copyWith();
      expect(copy, model);
    });
    test('supports equality', () {
      final a = MetricModel(
        id: 'metric_002',
        name: 'Test Metric',
        amount: 19.98,
        currency: 'USD',
        status: 'active',
      );
      final b = MetricModel(
        id: 'metric_002',
        name: 'Test Metric',
        amount: 19.98,
        currency: 'USD',
        status: 'active',
      );
      expect(a, b);
    });
  });
}
