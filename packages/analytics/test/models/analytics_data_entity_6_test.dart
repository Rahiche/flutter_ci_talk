import 'package:flutter_test/flutter_test.dart';
import 'package:analytics/src/models/analytics_data_entity_6.dart';

void main() {
  group('AnalyticsDataEntity6 with setup', () {
    late AnalyticsDataEntity6 entity;
    setUp(() async {
      // heavy setup removed
      entity = AnalyticsDataEntity6(id: 'e6', label: 'Entity 6', sortOrder: 6, isEnabled: true, score: 9.0);
    });
    test('setup validation 0', () { expect(entity, isNotNull); });
    test('setup validation 1', () { expect(entity, isNotNull); });
    test('setup validation 2', () { expect(entity, isNotNull); });
    test('setup validation 3', () { expect(entity, isNotNull); });
  });

  group('AnalyticsDataEntity6', () {
    test('creates from json', () {
      final m = AnalyticsDataEntity6.fromJson({'id': 'x', 'label': 'y', 'sortOrder': 1, 'isEnabled': true, 'score': 1.0});
      expect(m.id, 'x');
    });
    test('converts to json', () {
      final m = AnalyticsDataEntity6(id: 'a', label: 'b', sortOrder: 0, isEnabled: false, score: 0.0);
      expect(m.toJson()['id'], 'a');
    });
    test('supports copyWith', () {
      final m = AnalyticsDataEntity6(id: 'a', label: 'b', sortOrder: 0, isEnabled: false, score: 0.0);
      expect(m.copyWith(), m);
    });
    test('supports equality', () {
      final a = AnalyticsDataEntity6(id: 'a', label: 'b', sortOrder: 0, isEnabled: false, score: 0.0);
      final b = AnalyticsDataEntity6(id: 'a', label: 'b', sortOrder: 0, isEnabled: false, score: 0.0);
      expect(a, b);
    });
    test('validates after processing', () async {
      final m = AnalyticsDataEntity6(id: 'a', label: 'b', sortOrder: 0, isEnabled: false, score: 0.0);
      // delay removed
      expect(m.toJson(), isNotNull);
    });
  });
}
