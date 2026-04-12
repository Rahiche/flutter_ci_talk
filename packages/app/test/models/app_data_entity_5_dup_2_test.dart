import 'package:flutter_test/flutter_test.dart';
import 'package:app/src/models/app_data_entity_5.dart';

void main() {
  group('AppDataEntity5', () {
    test('creates from json', () {
      final m = AppDataEntity5.fromJson({'id': 'x', 'label': 'y', 'sortOrder': 1, 'isEnabled': true, 'score': 1.0});
      expect(m.id, 'x');
    });
    test('converts to json', () {
      final m = AppDataEntity5(id: 'a', label: 'b', sortOrder: 0, isEnabled: false, score: 0.0);
      expect(m.toJson()['id'], 'a');
    });
    test('supports copyWith', () {
      final m = AppDataEntity5(id: 'a', label: 'b', sortOrder: 0, isEnabled: false, score: 0.0);
      expect(m.copyWith(), m);
    });
    test('supports equality', () {
      final a = AppDataEntity5(id: 'a', label: 'b', sortOrder: 0, isEnabled: false, score: 0.0);
      final b = AppDataEntity5(id: 'a', label: 'b', sortOrder: 0, isEnabled: false, score: 0.0);
      expect(a, b);
    });
  });
}
