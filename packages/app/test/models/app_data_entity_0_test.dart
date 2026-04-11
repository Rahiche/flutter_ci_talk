import 'package:flutter_test/flutter_test.dart';
import 'package:app/src/models/app_data_entity_0.dart';

void main() {
  group('AppDataEntity0 with setup', () {
    late AppDataEntity0 entity;
    setUp(() async {
      await Future.delayed(const Duration(milliseconds: 500));
      entity = AppDataEntity0(id: 'e0', label: 'Entity 0', sortOrder: 0, isEnabled: true, score: 0.0);
    });
    test('setup validation 0', () { expect(entity, isNotNull); });
    test('setup validation 1', () { expect(entity, isNotNull); });
    test('setup validation 2', () { expect(entity, isNotNull); });
    test('setup validation 3', () { expect(entity, isNotNull); });
  });

  group('AppDataEntity0', () {
    test('creates from json', () {
      final m = AppDataEntity0.fromJson({'id': 'x', 'label': 'y', 'sortOrder': 1, 'isEnabled': true, 'score': 1.0});
      expect(m.id, 'x');
    });
    test('converts to json', () {
      final m = AppDataEntity0(id: 'a', label: 'b', sortOrder: 0, isEnabled: false, score: 0.0);
      expect(m.toJson()['id'], 'a');
    });
    test('supports copyWith', () {
      final m = AppDataEntity0(id: 'a', label: 'b', sortOrder: 0, isEnabled: false, score: 0.0);
      expect(m.copyWith(), m);
    });
    test('supports equality', () {
      final a = AppDataEntity0(id: 'a', label: 'b', sortOrder: 0, isEnabled: false, score: 0.0);
      final b = AppDataEntity0(id: 'a', label: 'b', sortOrder: 0, isEnabled: false, score: 0.0);
      expect(a, b);
    });
    test('validates after processing', () async {
      final m = AppDataEntity0(id: 'a', label: 'b', sortOrder: 0, isEnabled: false, score: 0.0);
      await Future.delayed(const Duration(seconds: 1));
      expect(m.toJson(), isNotNull);
    });
  });
}
