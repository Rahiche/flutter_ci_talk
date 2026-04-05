import 'package:flutter_test/flutter_test.dart';
import 'package:app/src/models/audit_log_model.dart';

void main() {
  group('AuditLogModel', () {
    test('should create from json', () {
      final json = <String, dynamic>{
        'id': 'audit_log_010',
        'name': 'Test AuditLog',
        'value': 15.0,
        'category': 'general',
        'verified': false,
      };
      final model = AuditLogModel.fromJson(json);
      expect(model.id, 'audit_log_010');
      expect(model.name, 'Test AuditLog');
      expect(model.value, 15.0);
      expect(model.category, 'general');
      expect(model.verified, false);
    });
    test('should convert to json', () {
      final model = AuditLogModel(
        id: 'audit_log_010',
        name: 'Test AuditLog',
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
      final model = AuditLogModel(
        id: 'audit_log_010',
        name: 'Test AuditLog',
        value: 15.0,
        category: 'general',
        verified: false,
      );
      final copy = model.copyWith();
      expect(copy, model);
    });
    test('supports equality', () {
      final a = AuditLogModel(
        id: 'audit_log_010',
        name: 'Test AuditLog',
        value: 15.0,
        category: 'general',
        verified: false,
      );
      final b = AuditLogModel(
        id: 'audit_log_010',
        name: 'Test AuditLog',
        value: 15.0,
        category: 'general',
        verified: false,
      );
      expect(a, b);
    });
  });
}
