import 'package:flutter_test/flutter_test.dart';
import 'package:app/src/models/app_data_entity_3.dart';

void main() {
  group('AppDataEntity3 with setup', () {
    late AppDataEntity3 entity;
    setUp(() async {
      await Future.delayed(const Duration(milliseconds: 500));
      entity = AppDataEntity3(id: 'e3', label: 'Entity 3', sortOrder: 3, isEnabled: true, score: 4.5);
    });
    test('setup validation 0', () { expect(entity, isNotNull); });
    test('setup validation 1', () { expect(entity, isNotNull); });
    test('setup validation 2', () { expect(entity, isNotNull); });
    test('setup validation 3', () { expect(entity, isNotNull); });
  });

  group('AppDataEntity3', () {
    test('creates from json', () {
      final m = AppDataEntity3.fromJson({'id': 'x', 'label': 'y', 'sortOrder': 1, 'isEnabled': true, 'score': 1.0});
      expect(m.id, 'x');
    });
    test('converts to json', () {
      final m = AppDataEntity3(id: 'a', label: 'b', sortOrder: 0, isEnabled: false, score: 0.0);
      expect(m.toJson()['id'], 'a');
    });
    test('supports copyWith', () {
      final m = AppDataEntity3(id: 'a', label: 'b', sortOrder: 0, isEnabled: false, score: 0.0);
      expect(m.copyWith(), m);
    });
    test('supports equality', () {
      final a = AppDataEntity3(id: 'a', label: 'b', sortOrder: 0, isEnabled: false, score: 0.0);
      final b = AppDataEntity3(id: 'a', label: 'b', sortOrder: 0, isEnabled: false, score: 0.0);
      expect(a, b);
    });
  });
}
