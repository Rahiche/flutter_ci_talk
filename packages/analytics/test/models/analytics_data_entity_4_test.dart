import 'package:flutter_test/flutter_test.dart';
import 'package:analytics/src/models/analytics_data_entity_4.dart';

void main() {
  group('AnalyticsDataEntity4', () {
    test('creates from json', () {
      final m = AnalyticsDataEntity4.fromJson({'id': 'x', 'label': 'y', 'sortOrder': 1, 'isEnabled': true, 'score': 1.0});
      expect(m.id, 'x');
    });
    test('converts to json', () {
      final m = AnalyticsDataEntity4(id: 'a', label: 'b', sortOrder: 0, isEnabled: false, score: 0.0);
      expect(m.toJson()['id'], 'a');
    });
    test('supports copyWith', () {
      final m = AnalyticsDataEntity4(id: 'a', label: 'b', sortOrder: 0, isEnabled: false, score: 0.0);
      expect(m.copyWith(), m);
    });
    test('supports equality', () {
      final a = AnalyticsDataEntity4(id: 'a', label: 'b', sortOrder: 0, isEnabled: false, score: 0.0);
      final b = AnalyticsDataEntity4(id: 'a', label: 'b', sortOrder: 0, isEnabled: false, score: 0.0);
      expect(a, b);
    });
    test('validates after processing', () async {
      final m = AnalyticsDataEntity4(id: 'a', label: 'b', sortOrder: 0, isEnabled: false, score: 0.0);
      await Future.delayed(const Duration(milliseconds: 200));
      expect(m.toJson(), isNotNull);
    });
  });
}
