import 'package:flutter_test/flutter_test.dart';
import 'package:payments/src/services/refund_service.dart';

void main() {
  group('RefundService', () {
    late RefundService service;

    setUp(() {
      service = RefundService();
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
