import 'package:flutter_test/flutter_test.dart';
import 'package:payments/src/models/invoice_model.dart';

void main() {
  group('InvoiceModel', () {
    test('should create from json', () {
      final json = <String, dynamic>{
        'id': 'invoice_003',
        'name': 'Test Invoice',
        'count': 12,
        'enabled': true,
        'description': 'A Invoice item',
      };
      final model = InvoiceModel.fromJson(json);
      expect(model.id, 'invoice_003');
      expect(model.name, 'Test Invoice');
      expect(model.count, 12);
      expect(model.enabled, true);
      expect(model.description, 'A Invoice item');
    });
    test('should convert to json', () {
      final model = InvoiceModel(
        id: 'invoice_003',
        name: 'Test Invoice',
        count: 12,
        enabled: true,
        description: 'A Invoice item',
      );
      final json = model.toJson();
      expect(json['id'], isNotNull);
      expect(json['name'], isNotNull);
      expect(json['count'], isNotNull);
      expect(json['enabled'], isNotNull);
      expect(json['description'], isNotNull);
    });
    test('supports copyWith', () {
      final model = InvoiceModel(
        id: 'invoice_003',
        name: 'Test Invoice',
        count: 12,
        enabled: true,
        description: 'A Invoice item',
      );
      final copy = model.copyWith();
      expect(copy, model);
    });
    test('supports equality', () {
      final a = InvoiceModel(
        id: 'invoice_003',
        name: 'Test Invoice',
        count: 12,
        enabled: true,
        description: 'A Invoice item',
      );
      final b = InvoiceModel(
        id: 'invoice_003',
        name: 'Test Invoice',
        count: 12,
        enabled: true,
        description: 'A Invoice item',
      );
      expect(a, b);
    });
  });
}
