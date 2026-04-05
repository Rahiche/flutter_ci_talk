import 'package:flutter_test/flutter_test.dart';
import 'package:core/src/repositories/theme_repository.dart';

void main() {
  group('ThemeRepository', () {
    late ThemeRepository repository;

    setUp(() {
      repository = ThemeRepository();
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
