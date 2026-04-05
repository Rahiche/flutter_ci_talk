import 'package:flutter_test/flutter_test.dart';
import 'package:core/src/services/storage_service.dart';

void main() {
  group('StorageService', () {
    late StorageService service;

    setUp(() {
      service = StorageService();
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
