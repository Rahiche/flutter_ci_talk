import 'package:flutter_test/flutter_test.dart';
import 'package:core/src/models/route_config.dart';

void main() {
  group('RouteConfig', () {
    test('should create from json', () {
      final json = <String, dynamic>{
        'id': 'route_config_007',
        'name': 'Test RouteConfig',
        'amount': 69.93,
        'currency': 'USD',
        'status': 'active',
      };
      final model = RouteConfig.fromJson(json);
      expect(model.id, 'route_config_007');
      expect(model.name, 'Test RouteConfig');
      expect(model.amount, 69.93);
      expect(model.currency, 'USD');
      expect(model.status, 'active');
    });
    test('should convert to json', () {
      final model = RouteConfig(
        id: 'route_config_007',
        name: 'Test RouteConfig',
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
      final model = RouteConfig(
        id: 'route_config_007',
        name: 'Test RouteConfig',
        amount: 69.93,
        currency: 'USD',
        status: 'active',
      );
      final copy = model.copyWith();
      expect(copy, model);
    });
    test('supports equality', () {
      final a = RouteConfig(
        id: 'route_config_007',
        name: 'Test RouteConfig',
        amount: 69.93,
        currency: 'USD',
        status: 'active',
      );
      final b = RouteConfig(
        id: 'route_config_007',
        name: 'Test RouteConfig',
        amount: 69.93,
        currency: 'USD',
        status: 'active',
      );
      expect(a, b);
    });
  });
}
