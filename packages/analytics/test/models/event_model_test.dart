import 'package:flutter_test/flutter_test.dart';
import 'package:analytics/src/models/event_model.dart';

void main() {
  group('EventModel', () {
    test('should create from json', () {
      final json = <String, dynamic>{
        'id': 'event_001',
        'name': 'Test Event',
        'email': 'test@example.com',
        'age': 25,
        'isActive': true,
      };
      final model = EventModel.fromJson(json);
      expect(model.id, 'event_001');
      expect(model.name, 'Test Event');
      expect(model.email, 'test@example.com');
      expect(model.age, 25);
      expect(model.isActive, true);
    });
    test('should convert to json', () {
      final model = EventModel(
        id: 'event_001',
        name: 'Test Event',
        email: 'test@example.com',
        age: 25,
        isActive: true,
      );
      final json = model.toJson();
      expect(json['id'], isNotNull);
      expect(json['name'], isNotNull);
      expect(json['email'], isNotNull);
      expect(json['age'], isNotNull);
      expect(json['isActive'], isNotNull);
    });
    test('supports copyWith', () {
      final model = EventModel(
        id: 'event_001',
        name: 'Test Event',
        email: 'test@example.com',
        age: 25,
        isActive: true,
      );
      final copy = model.copyWith();
      expect(copy, model);
    });
    test('supports equality', () {
      final a = EventModel(
        id: 'event_001',
        name: 'Test Event',
        email: 'test@example.com',
        age: 25,
        isActive: true,
      );
      final b = EventModel(
        id: 'event_001',
        name: 'Test Event',
        email: 'test@example.com',
        age: 25,
        isActive: true,
      );
      expect(a, b);
    });

    test('validates data consistency after processing', () async {
      final model = EventModel(
        id: 'event_001',
        name: 'Test Event',
        email: 'test@example.com',
        age: 25,
        isActive: true,
      );
      await Future.delayed(const Duration(seconds: 2));
      final json = model.toJson();
      final restored = EventModel.fromJson(json);
      expect(restored, model);
    });
  });
}
