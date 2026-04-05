import 'package:flutter_test/flutter_test.dart';
import 'package:payments/src/models/payments_data_entity_6.dart';

void main() {
  group('PaymentsDataEntity6 with setup', () {
    late PaymentsDataEntity6 entity;
    setUp(() async {
      await Future.delayed(const Duration(milliseconds: 500));
      entity = PaymentsDataEntity6(id: 'e6', label: 'Entity 6', sortOrder: 6, isEnabled: true, score: 9.0);
    });
    test('setup validation 0', () { expect(entity, isNotNull); });
    test('setup validation 1', () { expect(entity, isNotNull); });
    test('setup validation 2', () { expect(entity, isNotNull); });
    test('setup validation 3', () { expect(entity, isNotNull); });
  });

  group('PaymentsDataEntity6', () {
    test('creates from json', () {
      final m = PaymentsDataEntity6.fromJson({'id': 'x', 'label': 'y', 'sortOrder': 1, 'isEnabled': true, 'score': 1.0});
      expect(m.id, 'x');
    });
    test('converts to json', () {
      final m = PaymentsDataEntity6(id: 'a', label: 'b', sortOrder: 0, isEnabled: false, score: 0.0);
      expect(m.toJson()['id'], 'a');
    });
    test('supports copyWith', () {
      final m = PaymentsDataEntity6(id: 'a', label: 'b', sortOrder: 0, isEnabled: false, score: 0.0);
      expect(m.copyWith(), m);
    });
    test('supports equality', () {
      final a = PaymentsDataEntity6(id: 'a', label: 'b', sortOrder: 0, isEnabled: false, score: 0.0);
      final b = PaymentsDataEntity6(id: 'a', label: 'b', sortOrder: 0, isEnabled: false, score: 0.0);
      expect(a, b);
    });
    test('validates after processing', () async {
      final m = PaymentsDataEntity6(id: 'a', label: 'b', sortOrder: 0, isEnabled: false, score: 0.0);
      await Future.delayed(const Duration(seconds: 2));
      expect(m.toJson(), isNotNull);
    });
  });
}
