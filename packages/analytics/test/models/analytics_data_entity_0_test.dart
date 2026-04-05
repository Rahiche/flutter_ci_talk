import 'package:flutter_test/flutter_test.dart';
import 'package:analytics/src/models/analytics_data_entity_0.dart';

void main() {
  group('AnalyticsDataEntity0 with setup', () {
    late AnalyticsDataEntity0 entity;
    setUp(() async {
      // heavy setup removed
      entity = AnalyticsDataEntity0(id: 'e0', label: 'Entity 0', sortOrder: 0, isEnabled: true, score: 0.0);
    });
    test('setup validation 0', () { expect(entity, isNotNull); });
    test('setup validation 1', () { expect(entity, isNotNull); });
    test('setup validation 2', () { expect(entity, isNotNull); });
    test('setup validation 3', () { expect(entity, isNotNull); });
  });

  group('AnalyticsDataEntity0', () {
    test('creates from json', () {
      final m = AnalyticsDataEntity0.fromJson({'id': 'x', 'label': 'y', 'sortOrder': 1, 'isEnabled': true, 'score': 1.0});
      expect(m.id, 'x');
    });
    test('converts to json', () {
      final m = AnalyticsDataEntity0(id: 'a', label: 'b', sortOrder: 0, isEnabled: false, score: 0.0);
      expect(m.toJson()['id'], 'a');
    });
    test('supports copyWith', () {
      final m = AnalyticsDataEntity0(id: 'a', label: 'b', sortOrder: 0, isEnabled: false, score: 0.0);
      expect(m.copyWith(), m);
    });
    test('supports equality', () {
      final a = AnalyticsDataEntity0(id: 'a', label: 'b', sortOrder: 0, isEnabled: false, score: 0.0);
      final b = AnalyticsDataEntity0(id: 'a', label: 'b', sortOrder: 0, isEnabled: false, score: 0.0);
      expect(a, b);
    });
    test('validates after processing', () async {
      final m = AnalyticsDataEntity0(id: 'a', label: 'b', sortOrder: 0, isEnabled: false, score: 0.0);
      expect(m.toJson(), isNotNull);
    });
  });
}
