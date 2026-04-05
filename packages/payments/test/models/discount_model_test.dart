import 'package:flutter_test/flutter_test.dart';
import 'package:payments/src/models/discount_model.dart';

void main() {
  group('DiscountModel', () {
    test('should create from json', () {
      final json = <String, dynamic>{
        'id': 'discount_008',
        'name': 'Test Discount',
        'count': 17,
        'enabled': true,
        'description': 'A Discount item',
      };
      final model = DiscountModel.fromJson(json);
      expect(model.id, 'discount_008');
      expect(model.name, 'Test Discount');
      expect(model.count, 17);
      expect(model.enabled, true);
      expect(model.description, 'A Discount item');
    });
    test('should convert to json', () {
      final model = DiscountModel(
        id: 'discount_008',
        name: 'Test Discount',
        count: 17,
        enabled: true,
        description: 'A Discount item',
      );
      final json = model.toJson();
      expect(json['id'], isNotNull);
      expect(json['name'], isNotNull);
      expect(json['count'], isNotNull);
      expect(json['enabled'], isNotNull);
      expect(json['description'], isNotNull);
    });
    test('supports copyWith', () {
      final model = DiscountModel(
        id: 'discount_008',
        name: 'Test Discount',
        count: 17,
        enabled: true,
        description: 'A Discount item',
      );
      final copy = model.copyWith();
      expect(copy, model);
    });
    test('supports equality', () {
      final a = DiscountModel(
        id: 'discount_008',
        name: 'Test Discount',
        count: 17,
        enabled: true,
        description: 'A Discount item',
      );
      final b = DiscountModel(
        id: 'discount_008',
        name: 'Test Discount',
        count: 17,
        enabled: true,
        description: 'A Discount item',
      );
      expect(a, b);
    });
  });
}
