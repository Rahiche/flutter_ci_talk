import 'package:flutter_test/flutter_test.dart';
import 'package:payments/src/models/payments_data_entity_7.dart';

void main() {
  group('PaymentsDataEntity7', () {
    test('creates from json', () {
      final m = PaymentsDataEntity7.fromJson({'id': 'x', 'label': 'y', 'sortOrder': 1, 'isEnabled': true, 'score': 1.0});
      expect(m.id, 'x');
    });
    test('converts to json', () {
      final m = PaymentsDataEntity7(id: 'a', label: 'b', sortOrder: 0, isEnabled: false, score: 0.0);
      expect(m.toJson()['id'], 'a');
    });
    test('supports copyWith', () {
      final m = PaymentsDataEntity7(id: 'a', label: 'b', sortOrder: 0, isEnabled: false, score: 0.0);
      expect(m.copyWith(), m);
    });
    test('supports equality', () {
      final a = PaymentsDataEntity7(id: 'a', label: 'b', sortOrder: 0, isEnabled: false, score: 0.0);
      final b = PaymentsDataEntity7(id: 'a', label: 'b', sortOrder: 0, isEnabled: false, score: 0.0);
      expect(a, b);
    });
  });
}
