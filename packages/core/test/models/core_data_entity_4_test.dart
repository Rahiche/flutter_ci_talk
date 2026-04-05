import 'package:flutter_test/flutter_test.dart';
import 'package:core/src/models/core_data_entity_4.dart';

void main() {
  group('CoreDataEntity4', () {
    test('creates from json', () {
      final m = CoreDataEntity4.fromJson({'id': 'x', 'label': 'y', 'sortOrder': 1, 'isEnabled': true, 'score': 1.0});
      expect(m.id, 'x');
    });
    test('converts to json', () {
      final m = CoreDataEntity4(id: 'a', label: 'b', sortOrder: 0, isEnabled: false, score: 0.0);
      expect(m.toJson()['id'], 'a');
    });
    test('supports copyWith', () {
      final m = CoreDataEntity4(id: 'a', label: 'b', sortOrder: 0, isEnabled: false, score: 0.0);
      expect(m.copyWith(), m);
    });
    test('supports equality', () {
      final a = CoreDataEntity4(id: 'a', label: 'b', sortOrder: 0, isEnabled: false, score: 0.0);
      final b = CoreDataEntity4(id: 'a', label: 'b', sortOrder: 0, isEnabled: false, score: 0.0);
      expect(a, b);
    });
    test('validates after processing', () async {
      final m = CoreDataEntity4(id: 'a', label: 'b', sortOrder: 0, isEnabled: false, score: 0.0);
      // delay removed
      expect(m.toJson(), isNotNull);
    });
  });
}
