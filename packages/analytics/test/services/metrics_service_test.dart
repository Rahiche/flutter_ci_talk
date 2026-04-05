import 'package:flutter_test/flutter_test.dart';
import 'package:analytics/src/services/metrics_service.dart';

void main() {
  group('MetricsService', () {
    late MetricsService service;

    setUp(() {
      service = MetricsService();
    });

    test('fetch returns result', () async {
      final result = await service.fetch();
      expect(result, isNotNull);
    });

    test('create returns result', () async {
      final result = await service.create();
      expect(result, isNotNull);
    });

    test('update returns result', () async {
      final result = await service.update();
      expect(result, isNotNull);
    });

    test('delete returns result', () async {
      final result = await service.delete();
      expect(result, isNotNull);
    });

  });
}
