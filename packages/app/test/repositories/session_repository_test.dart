import 'package:flutter_test/flutter_test.dart';
import 'package:app/src/repositories/session_repository.dart';

void main() {
  group('SessionRepository', () {
    late SessionRepository repository;

    setUp(() {
      repository = SessionRepository();
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
