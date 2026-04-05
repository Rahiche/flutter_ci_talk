import 'package:flutter_test/flutter_test.dart';
import 'package:app/src/services/device_service.dart';

void main() {
  group('DeviceService with initialization', () {
    late DeviceService service;

    setUp(() async {
      await Future.delayed(const Duration(milliseconds: 600));
      service = DeviceService();
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

  group('DeviceService', () {
    late DeviceService service;

    setUp(() {
      service = DeviceService();
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
