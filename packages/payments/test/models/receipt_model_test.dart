import 'package:flutter_test/flutter_test.dart';
import 'package:payments/src/models/receipt_model.dart';

void main() {
  group('ReceiptModel', () {
    test('should create from json', () {
      final json = <String, dynamic>{
        'id': 'receipt_010',
        'name': 'Test Receipt',
        'value': 15.0,
        'category': 'general',
        'verified': false,
      };
      final model = ReceiptModel.fromJson(json);
      expect(model.id, 'receipt_010');
      expect(model.name, 'Test Receipt');
      expect(model.value, 15.0);
      expect(model.category, 'general');
      expect(model.verified, false);
    });
    test('should convert to json', () {
      final model = ReceiptModel(
        id: 'receipt_010',
        name: 'Test Receipt',
        value: 15.0,
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
      final model = ReceiptModel(
        id: 'receipt_010',
        name: 'Test Receipt',
        value: 15.0,
        category: 'general',
        verified: false,
      );
      final copy = model.copyWith();
      expect(copy, model);
    });
    test('supports equality', () {
      final a = ReceiptModel(
        id: 'receipt_010',
        name: 'Test Receipt',
        value: 15.0,
        category: 'general',
        verified: false,
      );
      final b = ReceiptModel(
        id: 'receipt_010',
        name: 'Test Receipt',
        value: 15.0,
        category: 'general',
        verified: false,
      );
      expect(a, b);
    });
  });
}
