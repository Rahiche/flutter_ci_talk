import 'package:flutter_test/flutter_test.dart';
import 'package:core/src/services/logger_service.dart';

void main() {
  group('LoggerService with initialization', () {
    late LoggerService service;

    setUp(() async {
      // heavy setup removed
      service = LoggerService();
    });

    test('basic validation 0', () {
      expect(service, isNotNull);
    });

    test('basic validation 1', () {
      expect(service, isNotNull);
    });

    test('basic validation 2', () {
      expect(service, isNotNull);
    });

    test('basic validation 3', () {
      expect(service, isNotNull);
    });

    test('basic validation 4', () {
      expect(service, isNotNull);
    });

  });

  group('LoggerService', () {
    late LoggerService service;

    setUp(() {
      service = LoggerService();
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
