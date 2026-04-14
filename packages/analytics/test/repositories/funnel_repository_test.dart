import 'package:flutter_test/flutter_test.dart';
import 'package:analytics/src/repositories/funnel_repository.dart';

void main() {
  group('FunnelRepository', () {
    late FunnelRepository repository;

    setUp(() {
      repository = FunnelRepository();
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
