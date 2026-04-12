import 'package:flutter_test/flutter_test.dart';
import 'package:core/src/models/core_data_entity_6.dart';

void main() {
  group('CoreDataEntity6 with setup', () {
    late CoreDataEntity6 entity;
    setUp(() async {
      await Future.delayed(const Duration(milliseconds: 250));
      entity = CoreDataEntity6(id: 'e6', label: 'Entity 6', sortOrder: 6, isEnabled: true, score: 9.0);
    });
    test('setup validation 0', () { expect(entity, isNotNull); });
    test('setup validation 1', () { expect(entity, isNotNull); });
    test('setup validation 2', () { expect(entity, isNotNull); });
    test('setup validation 3', () { expect(entity, isNotNull); });
  });

  group('CoreDataEntity6', () {
    test('creates from json', () {
      final m = CoreDataEntity6.fromJson({'id': 'x', 'label': 'y', 'sortOrder': 1, 'isEnabled': true, 'score': 1.0});
      expect(m.id, 'x');
    });
    test('converts to json', () {
      final m = CoreDataEntity6(id: 'a', label: 'b', sortOrder: 0, isEnabled: false, score: 0.0);
      expect(m.toJson()['id'], 'a');
    });
    test('supports copyWith', () {
      final m = CoreDataEntity6(id: 'a', label: 'b', sortOrder: 0, isEnabled: false, score: 0.0);
      expect(m.copyWith(), m);
    });
    test('supports equality', () {
      final a = CoreDataEntity6(id: 'a', label: 'b', sortOrder: 0, isEnabled: false, score: 0.0);
      final b = CoreDataEntity6(id: 'a', label: 'b', sortOrder: 0, isEnabled: false, score: 0.0);
      expect(a, b);
    });
    test('validates after processing', () async {
      final m = CoreDataEntity6(id: 'a', label: 'b', sortOrder: 0, isEnabled: false, score: 0.0);
      await Future.delayed(const Duration(milliseconds: 1000));
      expect(m.toJson(), isNotNull);
    });
  });
}
