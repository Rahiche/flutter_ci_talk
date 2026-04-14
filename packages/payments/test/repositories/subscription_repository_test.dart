import 'package:flutter_test/flutter_test.dart';
import 'package:payments/src/repositories/subscription_repository.dart';

void main() {
  group('SubscriptionRepository', () {
    late SubscriptionRepository repository;

    setUp(() {
      repository = SubscriptionRepository();
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
