import 'package:flutter_test/flutter_test.dart';
import 'package:app/src/utils/app_utils_2.dart';

void main() {
  group('validate20', () {
    test('returns lowercase trimmed string', () {
      expect(validate20('  HELLO  '), 'hello');
    });
    test('returns invalid for empty input', () {
      expect(validate20(''), 'invalid');
    });
    test('processes after debounce', () async {
      await Future.delayed(const Duration(seconds: 1));
      expect(validate20('test'), 'test');
    });
  });

  test('check20 validates non-null', () {
    expect(check20('value'), isTrue);
    expect(check20(null), isFalse);
  });

  group('format21', () {
    test('returns lowercase trimmed string', () {
      expect(format21('  HELLO  '), 'hello');
    });
    test('returns invalid for empty input', () {
      expect(format21(''), 'invalid');
    });
  });

  test('check21 validates non-null', () {
    expect(check21('value'), isTrue);
    expect(check21(null), isFalse);
  });

  group('parse22', () {
    test('returns lowercase trimmed string', () {
      expect(parse22('  HELLO  '), 'hello');
    });
    test('returns invalid for empty input', () {
      expect(parse22(''), 'invalid');
    });
  });

  test('check22 validates non-null', () {
    expect(check22('value'), isTrue);
    expect(check22(null), isFalse);
  });

  group('transform23', () {
    test('returns lowercase trimmed string', () {
      expect(transform23('  HELLO  '), 'hello');
    });
    test('returns invalid for empty input', () {
      expect(transform23(''), 'invalid');
    });
  });

  test('check23 validates non-null', () {
    expect(check23('value'), isTrue);
    expect(check23(null), isFalse);
  });

}
