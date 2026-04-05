import 'package:flutter_test/flutter_test.dart';
import 'package:payments/src/models/card_model.dart';

void main() {
  group('CardModel', () {
    test('should create from json', () {
      final json = <String, dynamic>{
        'id': 'card_006',
        'name': 'Test Card',
        'email': 'test@example.com',
        'age': 30,
        'isActive': true,
      };
      final model = CardModel.fromJson(json);
      expect(model.id, 'card_006');
      expect(model.name, 'Test Card');
      expect(model.email, 'test@example.com');
      expect(model.age, 30);
      expect(model.isActive, true);
    });
    test('should convert to json', () {
      final model = CardModel(
        id: 'card_006',
        name: 'Test Card',
        email: 'test@example.com',
        age: 30,
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
      final model = CardModel(
        id: 'card_006',
        name: 'Test Card',
        email: 'test@example.com',
        age: 30,
        isActive: true,
      );
      final copy = model.copyWith();
      expect(copy, model);
    });
    test('supports equality', () {
      final a = CardModel(
        id: 'card_006',
        name: 'Test Card',
        email: 'test@example.com',
        age: 30,
        isActive: true,
      );
      final b = CardModel(
        id: 'card_006',
        name: 'Test Card',
        email: 'test@example.com',
        age: 30,
        isActive: true,
      );
      expect(a, b);
    });
  });
}
