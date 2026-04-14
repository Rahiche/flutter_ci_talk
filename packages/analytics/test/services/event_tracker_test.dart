import 'package:flutter_test/flutter_test.dart';
import 'package:analytics/src/services/event_tracker.dart';

void main() {
  group('EventTracker', () {
    late EventTracker service;

    setUp(() {
      service = EventTracker();
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
