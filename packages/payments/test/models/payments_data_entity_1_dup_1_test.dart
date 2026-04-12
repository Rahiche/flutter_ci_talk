import 'package:flutter_test/flutter_test.dart';
import 'package:payments/src/models/payments_data_entity_1.dart';

void main() {
  group('PaymentsDataEntity1', () {
    test('creates from json', () {
      final m = PaymentsDataEntity1.fromJson({'id': 'x', 'label': 'y', 'sortOrder': 1, 'isEnabled': true, 'score': 1.0});
      expect(m.id, 'x');
    });
    test('converts to json', () {
      final m = PaymentsDataEntity1(id: 'a', label: 'b', sortOrder: 0, isEnabled: false, score: 0.0);
      expect(m.toJson()['id'], 'a');
    });
    test('supports copyWith', () {
      final m = PaymentsDataEntity1(id: 'a', label: 'b', sortOrder: 0, isEnabled: false, score: 0.0);
      expect(m.copyWith(), m);
    });
    test('supports equality', () {
      final a = PaymentsDataEntity1(id: 'a', label: 'b', sortOrder: 0, isEnabled: false, score: 0.0);
      final b = PaymentsDataEntity1(id: 'a', label: 'b', sortOrder: 0, isEnabled: false, score: 0.0);
      expect(a, b);
    });
  });
}
