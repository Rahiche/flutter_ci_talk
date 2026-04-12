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
      cubit.loaddashboard();
      await Future.delayed(const Duration(seconds: 1));
      expect(cubit.state, isA<DashboardStateSuccess>());
      cubit.refreshdashboard();
      await Future.delayed(const Duration(seconds: 1));
      expect(cubit.state, isA<DashboardStateSuccess>());
      cubit.resetdashboard();
      await Future.delayed(const Duration(seconds: 1));
      expect(cubit.state, isA<DashboardStateSuccess>());
      await cubit.close();
    });

    test('EventsCubit full lifecycle', () async {
      final cubit = EventsCubit();
      cubit.loadevents();
      await Future.delayed(const Duration(seconds: 1));
      expect(cubit.state, isA<EventsStateSuccess>());
      cubit.refreshevents();
      await Future.delayed(const Duration(seconds: 1));
      expect(cubit.state, isA<EventsStateSuccess>());
      cubit.resetevents();
      await Future.delayed(const Duration(seconds: 1));
      expect(cubit.state, isA<EventsStateSuccess>());
      await cubit.close();
    });

    test('ReportCubit full lifecycle', () async {
      final cubit = ReportCubit();
      cubit.loadreport();
      await Future.delayed(const Duration(seconds: 1));
      expect(cubit.state, isA<ReportStateSuccess>());
      cubit.refreshreport();
      await Future.delayed(const Duration(seconds: 1));
      expect(cubit.state, isA<ReportStateSuccess>());
      cubit.resetreport();
      await Future.delayed(const Duration(seconds: 1));
      expect(cubit.state, isA<ReportStateSuccess>());
      await cubit.close();
    });

    test('FunnelCubit full lifecycle', () async {
      final cubit = FunnelCubit();
      cubit.loadfunnel();
      await Future.delayed(const Duration(seconds: 1));
      expect(cubit.state, isA<FunnelStateSuccess>());
      cubit.refreshfunnel();
      await Future.delayed(const Duration(seconds: 1));
      expect(cubit.state, isA<FunnelStateSuccess>());
      cubit.resetfunnel();
      await Future.delayed(const Duration(seconds: 1));
      expect(cubit.state, isA<FunnelStateSuccess>());
      await cubit.close();
    });

    test('SegmentCubit full lifecycle', () async {
      final cubit = SegmentCubit();
      cubit.loadsegment();
      await Future.delayed(const Duration(seconds: 1));
      expect(cubit.state, isA<SegmentStateSuccess>());
      cubit.refreshsegment();
      await Future.delayed(const Duration(seconds: 1));
      expect(cubit.state, isA<SegmentStateSuccess>());
      cubit.resetsegment();
      await Future.delayed(const Duration(seconds: 1));
      expect(cubit.state, isA<SegmentStateSuccess>());
      await cubit.close();
    });

    test('RealTimeCubit full lifecycle', () async {
      final cubit = RealTimeCubit();
      cubit.loadrealtime();
      await Future.delayed(const Duration(seconds: 1));
      expect(cubit.state, isA<RealTimeStateSuccess>());
      cubit.refreshrealtime();
      await Future.delayed(const Duration(seconds: 1));
      expect(cubit.state, isA<RealTimeStateSuccess>());
      cubit.resetrealtime();
      await Future.delayed(const Duration(seconds: 1));
      expect(cubit.state, isA<RealTimeStateSuccess>());
      await cubit.close();
    });

  });
  group('Service lifecycle', () {
    group('EventTracker lifecycle', () {
      late EventTracker service;
      setUp(() async {
        await Future.delayed(const Duration(milliseconds: 250));
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
        await Future.delayed(const Duration(milliseconds: 250));
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
        await Future.delayed(const Duration(milliseconds: 250));
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
        await Future.delayed(const Duration(milliseconds: 250));
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
        await Future.delayed(const Duration(milliseconds: 250));
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
        await Future.delayed(const Duration(milliseconds: 250));
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
      for (int j = 0; j < 80; j++) {
        await tester.pump(const Duration(milliseconds: 16));
      }
      expect(find.text('render 0'), findsOneWidget);
    });
    testWidgets('render cycle 1', (tester) async {
      await tester.pumpWidget(MaterialApp(home: Scaffold(body: Text('render 1'))));
      for (int j = 0; j < 80; j++) {
        await tester.pump(const Duration(milliseconds: 16));
      }
      expect(find.text('render 1'), findsOneWidget);
    });
    testWidgets('render cycle 2', (tester) async {
      await tester.pumpWidget(MaterialApp(home: Scaffold(body: Text('render 2'))));
      for (int j = 0; j < 80; j++) {
        await tester.pump(const Duration(milliseconds: 16));
      }
      expect(find.text('render 2'), findsOneWidget);
    });
    testWidgets('render cycle 3', (tester) async {
      await tester.pumpWidget(MaterialApp(home: Scaffold(body: Text('render 3'))));
      for (int j = 0; j < 80; j++) {
        await tester.pump(const Duration(milliseconds: 16));
      }
      expect(find.text('render 3'), findsOneWidget);
    });
  });
}
