import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:analytics/src/widgets/segment_picker.dart';

void main() {
  group('SegmentPicker', () {
    testWidgets('renders without error', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: SegmentPicker())));
      await tester.pump(const Duration(milliseconds: 200));
      expect(find.byType(SegmentPicker), findsOneWidget);
    });
    testWidgets('builds correctly', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: SegmentPicker())));
      await tester.pump(const Duration(milliseconds: 200));
      expect(find.byType(SegmentPicker), findsOneWidget);
    });

    testWidgets('animation stress test', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: SegmentPicker())));
      await tester.pumpAndSettle();
      expect(find.byType(SegmentPicker), findsOneWidget);
    });
  });
}
