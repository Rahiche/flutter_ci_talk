import 'package:flutter_test/flutter_test.dart';
import 'package:analytics/src/repositories/metrics_repository.dart';

void main() {
  group('MetricsRepository', () {
    late MetricsRepository repository;

    setUp(() {
      repository = MetricsRepository();
    });

    test('getAll returns data', () async {
      final result = await repository.getAll();
      expect(result, isNotNull);
    });

    test('getById returns data', () async {
      final result = await repository.getById();
      expect(result, isNotNull);
    });

    test('save returns data', () async {
      final result = await repository.save();
      expect(result, isNotNull);
    });

  });
}
