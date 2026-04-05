import 'package:flutter_test/flutter_test.dart';
import 'package:analytics/src/repositories/event_repository.dart';

void main() {
  group('EventRepository', () {
    late EventRepository repository;

    setUp(() {
      repository = EventRepository();
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
