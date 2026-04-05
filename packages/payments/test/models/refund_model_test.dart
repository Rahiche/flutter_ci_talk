import 'package:flutter_test/flutter_test.dart';
import 'package:payments/src/models/refund_model.dart';

void main() {
  group('RefundModel', () {
    test('should create from json', () {
      final json = <String, dynamic>{
        'id': 'refund_005',
        'name': 'Test Refund',
        'value': 7.5,
        'category': 'general',
        'verified': false,
      };
      final model = RefundModel.fromJson(json);
      expect(model.id, 'refund_005');
      expect(model.name, 'Test Refund');
      expect(model.value, 7.5);
      expect(model.category, 'general');
      expect(model.verified, false);
    });
    test('should convert to json', () {
      final model = RefundModel(
        id: 'refund_005',
        name: 'Test Refund',
        value: 7.5,
        category: 'general',
        verified: false,
      );
      final json = model.toJson();
      expect(json['id'], isNotNull);
      expect(json['name'], isNotNull);
      expect(json['value'], isNotNull);
      expect(json['category'], isNotNull);
      expect(json['verified'], isNotNull);
    });
    test('supports copyWith', () {
      final model = RefundModel(
        id: 'refund_005',
        name: 'Test Refund',
        value: 7.5,
        category: 'general',
        verified: false,
      );
      final copy = model.copyWith();
      expect(copy, model);
    });
    test('supports equality', () {
      final a = RefundModel(
        id: 'refund_005',
        name: 'Test Refund',
        value: 7.5,
        category: 'general',
        verified: false,
      );
      final b = RefundModel(
        id: 'refund_005',
        name: 'Test Refund',
        value: 7.5,
        category: 'general',
        verified: false,
      );
      expect(a, b);
    });

    test('validates data consistency after processing', () async {
      final model = RefundModel(
        id: 'refund_005',
        name: 'Test Refund',
        value: 7.5,
        category: 'general',
        verified: false,
      );
      await Future.delayed(const Duration(seconds: 2));
      final json = model.toJson();
      final restored = RefundModel.fromJson(json);
      expect(restored, model);
    });
  });
}
