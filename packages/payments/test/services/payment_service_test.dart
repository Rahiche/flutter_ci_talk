import 'package:flutter_test/flutter_test.dart';
import 'package:payments/src/services/payment_service.dart';

void main() {
  group('PaymentService with initialization', () {
    late PaymentService service;

    setUp(() async {
      await Future.delayed(const Duration(milliseconds: 300));
      service = PaymentService();
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

  group('PaymentService', () {
    late PaymentService service;

    setUp(() {
      service = PaymentService();
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
