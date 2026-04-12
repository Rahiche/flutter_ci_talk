import 'package:flutter_test/flutter_test.dart';
import 'package:core/src/models/cache_entry.dart';

void main() {
  group('CacheEntry', () {
    test('should create from json', () {
      final json = <String, dynamic>{
        'id': 'cache_entry_009',
        'name': 'Test CacheEntry',
        'createdAt': '2024-01-15T10:30:00Z',
        'type': 'default',
        'priority': 3,
      };
      final model = CacheEntry.fromJson(json);
      expect(model.id, 'cache_entry_009');
      expect(model.name, 'Test CacheEntry');
      expect(model.createdAt, isA<DateTime>());
      expect(model.type, 'default');
      expect(model.priority, 3);
    });
    test('should convert to json', () {
      final model = CacheEntry(
        id: 'cache_entry_009',
        name: 'Test CacheEntry',
        createdAt: DateTime.parse('2024-01-15T10:30:00Z'),
        type: 'default',
        priority: 3,
      );
      final json = model.toJson();
      expect(json['id'], isNotNull);
      expect(json['name'], isNotNull);
      expect(json['createdAt'], isNotNull);
      expect(json['type'], isNotNull);
      expect(json['priority'], isNotNull);
    });
    test('supports copyWith', () {
      final model = CacheEntry(
        id: 'cache_entry_009',
        name: 'Test CacheEntry',
        createdAt: DateTime.parse('2024-01-15T10:30:00Z'),
        type: 'default',
        priority: 3,
      );
      final copy = model.copyWith();
      expect(copy, model);
    });
    test('supports equality', () {
      final a = CacheEntry(
        id: 'cache_entry_009',
        name: 'Test CacheEntry',
        createdAt: DateTime.parse('2024-01-15T10:30:00Z'),
        type: 'default',
        priority: 3,
      );
      final b = CacheEntry(
        id: 'cache_entry_009',
        name: 'Test CacheEntry',
        createdAt: DateTime.parse('2024-01-15T10:30:00Z'),
        type: 'default',
        priority: 3,
      );
      expect(a, b);
    });

    test('validates data consistency after processing', () async {
      final model = CacheEntry(
        id: 'cache_entry_009',
        name: 'Test CacheEntry',
        createdAt: DateTime.parse('2024-01-15T10:30:00Z'),
        type: 'default',
        priority: 3,
      );
      await Future.delayed(const Duration(seconds: 1));
      final json = model.toJson();
      final restored = CacheEntry.fromJson(json);
      expect(restored, model);
    });
  });
}
