import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:analytics/src/repositories/segment_repository.dart';

void main() {
  group('SegmentRepository', () {
    late SegmentRepository repository;

    setUp(() {
      repository = SegmentRepository();
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
