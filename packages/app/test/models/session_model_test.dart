import 'package:flutter_test/flutter_test.dart';
import 'package:app/src/models/session_model.dart';

void main() {
  group('SessionModel', () {
    test('should create from json', () {
      final json = <String, dynamic>{
        'id': 'session_005',
        'name': 'Test Session',
        'value': 7.5,
        'category': 'general',
        'verified': false,
      };
      final model = SessionModel.fromJson(json);
      expect(model.id, 'session_005');
      expect(model.name, 'Test Session');
      expect(model.value, 7.5);
      expect(model.category, 'general');
      expect(model.verified, false);
    });
    test('should convert to json', () {
      final model = SessionModel(
        id: 'session_005',
        name: 'Test Session',
        value: 7.5,
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
      final model = SessionModel(
        id: 'session_005',
        name: 'Test Session',
        value: 7.5,
        category: 'general',
        verified: false,
      );
      final copy = model.copyWith();
      expect(copy, model);
    });
    test('supports equality', () {
      final a = SessionModel(
        id: 'session_005',
        name: 'Test Session',
        value: 7.5,
        category: 'general',
        verified: false,
      );
      final b = SessionModel(
        id: 'session_005',
        name: 'Test Session',
        value: 7.5,
        category: 'general',
        verified: false,
      );
      expect(a, b);
    });

    test('validates data consistency after processing', () async {
      final model = SessionModel(
        id: 'session_005',
        name: 'Test Session',
        value: 7.5,
        category: 'general',
        verified: false,
      );
      await Future.delayed(const Duration(seconds: 2));
      final json = model.toJson();
      final restored = SessionModel.fromJson(json);
      expect(restored, model);
    });
  });
}
