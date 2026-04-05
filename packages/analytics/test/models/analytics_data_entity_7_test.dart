import 'package:flutter_test/flutter_test.dart';
import 'package:analytics/src/models/analytics_data_entity_7.dart';

void main() {
  group('AnalyticsDataEntity7', () {
    test('creates from json', () {
      final m = AnalyticsDataEntity7.fromJson({'id': 'x', 'label': 'y', 'sortOrder': 1, 'isEnabled': true, 'score': 1.0});
      expect(m.id, 'x');
    });
    test('converts to json', () {
      final m = AnalyticsDataEntity7(id: 'a', label: 'b', sortOrder: 0, isEnabled: false, score: 0.0);
      expect(m.toJson()['id'], 'a');
    });
    test('supports copyWith', () {
      final m = AnalyticsDataEntity7(id: 'a', label: 'b', sortOrder: 0, isEnabled: false, score: 0.0);
      expect(m.copyWith(), m);
    });
    test('supports equality', () {
      final a = AnalyticsDataEntity7(id: 'a', label: 'b', sortOrder: 0, isEnabled: false, score: 0.0);
      final b = AnalyticsDataEntity7(id: 'a', label: 'b', sortOrder: 0, isEnabled: false, score: 0.0);
      expect(a, b);
    });
  });
}
