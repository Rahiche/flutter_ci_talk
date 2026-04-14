import 'package:flutter_test/flutter_test.dart';
import 'package:payments/src/repositories/card_repository.dart';

void main() {
  group('CardRepository', () {
    late CardRepository repository;

    setUp(() {
      repository = CardRepository();
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
