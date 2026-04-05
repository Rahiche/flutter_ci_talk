import 'package:flutter_test/flutter_test.dart';
import 'package:analytics/src/models/segment_model.dart';

void main() {
  group('SegmentModel', () {
    test('should create from json', () {
      final json = <String, dynamic>{
        'id': 'segment_008',
        'name': 'Test Segment',
        'count': 17,
        'enabled': true,
        'description': 'A Segment item',
      };
      final model = SegmentModel.fromJson(json);
      expect(model.id, 'segment_008');
      expect(model.name, 'Test Segment');
      expect(model.count, 17);
      expect(model.enabled, true);
      expect(model.description, 'A Segment item');
    });
    test('should convert to json', () {
      final model = SegmentModel(
        id: 'segment_008',
        name: 'Test Segment',
        count: 17,
        enabled: true,
        description: 'A Segment item',
      );
      final json = model.toJson();
      expect(json['id'], isNotNull);
      expect(json['name'], isNotNull);
      expect(json['count'], isNotNull);
      expect(json['enabled'], isNotNull);
      expect(json['description'], isNotNull);
    });
    test('supports copyWith', () {
      final model = SegmentModel(
        id: 'segment_008',
        name: 'Test Segment',
        count: 17,
        enabled: true,
        description: 'A Segment item',
      );
      final copy = model.copyWith();
      expect(copy, model);
    });
    test('supports equality', () {
      final a = SegmentModel(
        id: 'segment_008',
        name: 'Test Segment',
        count: 17,
        enabled: true,
        description: 'A Segment item',
      );
      final b = SegmentModel(
        id: 'segment_008',
        name: 'Test Segment',
        count: 17,
        enabled: true,
        description: 'A Segment item',
      );
      expect(a, b);
    });
  });
}
