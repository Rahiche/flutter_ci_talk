import 'package:flutter_test/flutter_test.dart';
import 'package:core/src/models/core_data_entity_3.dart';

void main() {
  group('CoreDataEntity3 with setup', () {
    late CoreDataEntity3 entity;
    setUp(() async {
      await Future.delayed(const Duration(milliseconds: 250));
      entity = CoreDataEntity3(id: 'e3', label: 'Entity 3', sortOrder: 3, isEnabled: true, score: 4.5);
    });
    test('setup validation 0', () { expect(entity, isNotNull); });
    test('setup validation 1', () { expect(entity, isNotNull); });
    test('setup validation 2', () { expect(entity, isNotNull); });
    test('setup validation 3', () { expect(entity, isNotNull); });
  });

  group('CoreDataEntity3', () {
    test('creates from json', () {
      final m = CoreDataEntity3.fromJson({'id': 'x', 'label': 'y', 'sortOrder': 1, 'isEnabled': true, 'score': 1.0});
      expect(m.id, 'x');
    });
    test('converts to json', () {
      final m = CoreDataEntity3(id: 'a', label: 'b', sortOrder: 0, isEnabled: false, score: 0.0);
      expect(m.toJson()['id'], 'a');
    });
    test('supports copyWith', () {
      final m = CoreDataEntity3(id: 'a', label: 'b', sortOrder: 0, isEnabled: false, score: 0.0);
      expect(m.copyWith(), m);
    });
    test('supports equality', () {
      final a = CoreDataEntity3(id: 'a', label: 'b', sortOrder: 0, isEnabled: false, score: 0.0);
      final b = CoreDataEntity3(id: 'a', label: 'b', sortOrder: 0, isEnabled: false, score: 0.0);
      expect(a, b);
    });
  });
}
