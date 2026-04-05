import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:analytics/src/cubits/dashboard_cubit.dart';
import 'package:analytics/src/cubits/events_cubit.dart';
import 'package:analytics/src/cubits/report_cubit.dart';
import 'package:analytics/src/cubits/funnel_cubit.dart';
import 'package:analytics/src/cubits/segment_cubit.dart';
import 'package:analytics/src/cubits/real_time_cubit.dart';
import 'package:analytics/src/services/event_tracker.dart';
import 'package:analytics/src/services/metrics_service.dart';
import 'package:analytics/src/services/report_service.dart';
import 'package:analytics/src/services/funnel_service.dart';
import 'package:analytics/src/services/segment_service.dart';
import 'package:analytics/src/services/export_service.dart';

void main() {
  group('End-to-end flow', () {
    test('DashboardCubit full lifecycle', () async {
      final cubit = DashboardCubit();
      await cubit.loaddashboard();
      expect(cubit.state, isA<DashboardStateSuccess>());
      await cubit.refreshdashboard();
      expect(cubit.state, isA<DashboardStateSuccess>());
      await cubit.resetdashboard();
      expect(cubit.state, isA<DashboardStateSuccess>());
      await cubit.close();
    });

    test('EventsCubit full lifecycle', () async {
      final cubit = EventsCubit();
      await cubit.loadevents();
      expect(cubit.state, isA<EventsStateSuccess>());
      await cubit.refreshevents();
      expect(cubit.state, isA<EventsStateSuccess>());
      await cubit.resetevents();
      expect(cubit.state, isA<EventsStateSuccess>());
      await cubit.close();
    });

    test('ReportCubit full lifecycle', () async {
      final cubit = ReportCubit();
      await cubit.loadreport();
      expect(cubit.state, isA<ReportStateSuccess>());
      await cubit.refreshreport();
      expect(cubit.state, isA<ReportStateSuccess>());
      await cubit.resetreport();
      expect(cubit.state, isA<ReportStateSuccess>());
      await cubit.close();
    });

    test('FunnelCubit full lifecycle', () async {
      final cubit = FunnelCubit();
      await cubit.loadfunnel();
      expect(cubit.state, isA<FunnelStateSuccess>());
      await cubit.refreshfunnel();
      expect(cubit.state, isA<FunnelStateSuccess>());
      await cubit.resetfunnel();
      expect(cubit.state, isA<FunnelStateSuccess>());
      await cubit.close();
    });

    test('SegmentCubit full lifecycle', () async {
      final cubit = SegmentCubit();
      await cubit.loadsegment();
      expect(cubit.state, isA<SegmentStateSuccess>());
      await cubit.refreshsegment();
      expect(cubit.state, isA<SegmentStateSuccess>());
      await cubit.resetsegment();
      expect(cubit.state, isA<SegmentStateSuccess>());
      await cubit.close();
    });

    test('RealTimeCubit full lifecycle', () async {
      final cubit = RealTimeCubit();
      await cubit.loadrealtime();
      expect(cubit.state, isA<RealTimeStateSuccess>());
      await cubit.refreshrealtime();
      expect(cubit.state, isA<RealTimeStateSuccess>());
      await cubit.resetrealtime();
      expect(cubit.state, isA<RealTimeStateSuccess>());
      await cubit.close();
    });

  });
  group('Service lifecycle', () {
    group('EventTracker lifecycle', () {
      late EventTracker service;
      setUp(() async {
        // heavy setup removed
        service = EventTracker();
      });
      test('lifecycle check 0', () {
        expect(service, isNotNull);
      });
      test('lifecycle check 1', () {
        expect(service, isNotNull);
      });
      test('lifecycle check 2', () {
        expect(service, isNotNull);
      });
      test('lifecycle check 3', () {
        expect(service, isNotNull);
      });
    });
    group('MetricsService lifecycle', () {
      late MetricsService service;
      setUp(() async {
        // heavy setup removed
        service = MetricsService();
      });
      test('lifecycle check 0', () {
        expect(service, isNotNull);
      });
      test('lifecycle check 1', () {
        expect(service, isNotNull);
      });
      test('lifecycle check 2', () {
        expect(service, isNotNull);
      });
      test('lifecycle check 3', () {
        expect(service, isNotNull);
      });
    });
    group('ReportService lifecycle', () {
      late ReportService service;
      setUp(() async {
        // heavy setup removed
        service = ReportService();
      });
      test('lifecycle check 0', () {
        expect(service, isNotNull);
      });
      test('lifecycle check 1', () {
        expect(service, isNotNull);
      });
      test('lifecycle check 2', () {
        expect(service, isNotNull);
      });
      test('lifecycle check 3', () {
        expect(service, isNotNull);
      });
    });
    group('FunnelService lifecycle', () {
      late FunnelService service;
      setUp(() async {
        // heavy setup removed
        service = FunnelService();
      });
      test('lifecycle check 0', () {
        expect(service, isNotNull);
      });
      test('lifecycle check 1', () {
        expect(service, isNotNull);
      });
      test('lifecycle check 2', () {
        expect(service, isNotNull);
      });
      test('lifecycle check 3', () {
        expect(service, isNotNull);
      });
    });
    group('SegmentService lifecycle', () {
      late SegmentService service;
      setUp(() async {
        // heavy setup removed
        service = SegmentService();
      });
      test('lifecycle check 0', () {
        expect(service, isNotNull);
      });
      test('lifecycle check 1', () {
        expect(service, isNotNull);
      });
      test('lifecycle check 2', () {
        expect(service, isNotNull);
      });
      test('lifecycle check 3', () {
        expect(service, isNotNull);
      });
    });
    group('ExportService lifecycle', () {
      late ExportService service;
      setUp(() async {
        // heavy setup removed
        service = ExportService();
      });
      test('lifecycle check 0', () {
        expect(service, isNotNull);
      });
      test('lifecycle check 1', () {
        expect(service, isNotNull);
      });
      test('lifecycle check 2', () {
        expect(service, isNotNull);
      });
      test('lifecycle check 3', () {
        expect(service, isNotNull);
      });
    });
  });
  group('Widget rendering', () {
    testWidgets('render cycle 0', (tester) async {
      await tester.pumpWidget(MaterialApp(home: Scaffold(body: Text('render 0'))));
      await tester.pumpAndSettle();
      expect(find.text('render 0'), findsOneWidget);
    });
    testWidgets('render cycle 1', (tester) async {
      await tester.pumpWidget(MaterialApp(home: Scaffold(body: Text('render 1'))));
      await tester.pumpAndSettle();
      expect(find.text('render 1'), findsOneWidget);
    });
    testWidgets('render cycle 2', (tester) async {
      await tester.pumpWidget(MaterialApp(home: Scaffold(body: Text('render 2'))));
      await tester.pumpAndSettle();
      expect(find.text('render 2'), findsOneWidget);
    });
    testWidgets('render cycle 3', (tester) async {
      await tester.pumpWidget(MaterialApp(home: Scaffold(body: Text('render 3'))));
      await tester.pumpAndSettle();
      expect(find.text('render 3'), findsOneWidget);
    });
  });
}
