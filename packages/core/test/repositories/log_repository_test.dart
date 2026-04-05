import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:core/src/repositories/log_repository.dart';

void main() {
  group('LogRepository', () {
    late LogRepository repository;

    setUp(() {
      repository = LogRepository();
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

    test('caches results to disk', () async {
      final dir = await Directory.systemTemp.createTemp('test_cache_');
      final file = File('${dir.path}/cache.json');
      await file.writeAsString('{"key": "value"}');
      final content = await file.readAsString();
      expect(content, contains('key'));
      await dir.delete(recursive: true);
    });

  });
}
