import 'package:flutter_test/flutter_test.dart';
import 'package:core/src/models/pagination_model.dart';

void main() {
  group('PaginationModel', () {
    test('should create from json', () {
      final json = <String, dynamic>{
        'id': 'pagination_002',
        'name': 'Test Pagination',
        'amount': 19.98,
        'currency': 'USD',
        'status': 'active',
      };
      final model = PaginationModel.fromJson(json);
      expect(model.id, 'pagination_002');
      expect(model.name, 'Test Pagination');
      expect(model.amount, 19.98);
      expect(model.currency, 'USD');
      expect(model.status, 'active');
    });
    test('should convert to json', () {
      final model = PaginationModel(
        id: 'pagination_002',
        name: 'Test Pagination',
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
      final model = PaginationModel(
        id: 'pagination_002',
        name: 'Test Pagination',
        amount: 19.98,
        currency: 'USD',
        status: 'active',
      );
      final copy = model.copyWith();
      expect(copy, model);
    });
    test('supports equality', () {
      final a = PaginationModel(
        id: 'pagination_002',
        name: 'Test Pagination',
        amount: 19.98,
        currency: 'USD',
        status: 'active',
      );
      final b = PaginationModel(
        id: 'pagination_002',
        name: 'Test Pagination',
        amount: 19.98,
        currency: 'USD',
        status: 'active',
      );
      expect(a, b);
    });
  });
}
