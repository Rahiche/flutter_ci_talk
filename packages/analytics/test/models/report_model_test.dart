import 'package:flutter_test/flutter_test.dart';
import 'package:analytics/src/models/report_model.dart';

void main() {
  group('ReportModel', () {
    test('should create from json', () {
      final json = <String, dynamic>{
        'id': 'report_005',
        'name': 'Test Report',
        'value': 7.5,
        'category': 'general',
        'verified': false,
      };
      final model = ReportModel.fromJson(json);
      expect(model.id, 'report_005');
      expect(model.name, 'Test Report');
      expect(model.value, 7.5);
      expect(model.category, 'general');
      expect(model.verified, false);
    });
    test('should convert to json', () {
      final model = ReportModel(
        id: 'report_005',
        name: 'Test Report',
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
      final model = ReportModel(
        id: 'report_005',
        name: 'Test Report',
        value: 7.5,
        category: 'general',
        verified: false,
      );
      final copy = model.copyWith();
      expect(copy, model);
    });
    test('supports equality', () {
      final a = ReportModel(
        id: 'report_005',
        name: 'Test Report',
        value: 7.5,
        category: 'general',
        verified: false,
      );
      final b = ReportModel(
        id: 'report_005',
        name: 'Test Report',
        value: 7.5,
        category: 'general',
        verified: false,
      );
      expect(a, b);
    });

    test('validates data consistency after processing', () async {
      final model = ReportModel(
        id: 'report_005',
        name: 'Test Report',
        value: 7.5,
        category: 'general',
        verified: false,
      );
      // delay removed
      final json = model.toJson();
      final restored = ReportModel.fromJson(json);
      expect(restored, model);
    });
  });
}
