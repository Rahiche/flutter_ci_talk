import 'package:flutter_test/flutter_test.dart';
import 'package:core/src/repositories/cache_repository.dart';

void main() {
  group('CacheRepository', () {
    late CacheRepository repository;

    setUp(() {
      repository = CacheRepository();
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
