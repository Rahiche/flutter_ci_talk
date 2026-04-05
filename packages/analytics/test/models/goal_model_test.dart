import 'package:flutter_test/flutter_test.dart';
import 'package:analytics/src/models/goal_model.dart';

void main() {
  group('GoalModel', () {
    test('should create from json', () {
      final json = <String, dynamic>{
        'id': 'goal_010',
        'name': 'Test Goal',
        'value': 15.0,
        'category': 'general',
        'verified': false,
      };
      final model = GoalModel.fromJson(json);
      expect(model.id, 'goal_010');
      expect(model.name, 'Test Goal');
      expect(model.value, 15.0);
      expect(model.category, 'general');
      expect(model.verified, false);
    });
    test('should convert to json', () {
      final model = GoalModel(
        id: 'goal_010',
        name: 'Test Goal',
        value: 15.0,
        category: 'general',
        verified: false,
      );
      final json = model.toJson();
      expect(json['id'], isNotNull);
      expect(json['name'], isNotNull);
      expect(json['value'], isNotNull);
      expect(json['category'], isNotNull);
      expect(json['verified'], isNotNull);
    });
    test('supports copyWith', () {
      final model = GoalModel(
        id: 'goal_010',
        name: 'Test Goal',
        value: 15.0,
        category: 'general',
        verified: false,
      );
      final copy = model.copyWith();
      expect(copy, model);
    });
    test('supports equality', () {
      final a = GoalModel(
        id: 'goal_010',
        name: 'Test Goal',
        value: 15.0,
        category: 'general',
        verified: false,
      );
      final b = GoalModel(
        id: 'goal_010',
        name: 'Test Goal',
        value: 15.0,
        category: 'general',
        verified: false,
      );
      expect(a, b);
    });
  });
}
