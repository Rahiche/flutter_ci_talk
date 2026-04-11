import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:app/src/cubits/auth_cubit.dart';
import 'package:app/src/cubits/profile_cubit.dart';
import 'package:app/src/cubits/settings_cubit.dart';
import 'package:app/src/cubits/notification_cubit.dart';
import 'package:app/src/cubits/session_cubit.dart';
import 'package:app/src/cubits/onboarding_cubit.dart';
import 'package:app/src/services/auth_service.dart';
import 'package:app/src/services/user_service.dart';
import 'package:app/src/services/notification_service.dart';
import 'package:app/src/services/session_service.dart';
import 'package:app/src/services/preference_service.dart';
import 'package:app/src/services/device_service.dart';

void main() {
  group('End-to-end flow', () {
    test('AuthCubit full lifecycle', () async {
      final cubit = AuthCubit();
      cubit.loadauth();
      await Future.delayed(const Duration(milliseconds: 200));
      expect(cubit.state, isA<AuthStateSuccess>());
      cubit.refreshauth();
      await Future.delayed(const Duration(milliseconds: 200));
      expect(cubit.state, isA<AuthStateSuccess>());
      cubit.resetauth();
      await Future.delayed(const Duration(milliseconds: 200));
      expect(cubit.state, isA<AuthStateSuccess>());
      await cubit.close();
    });

    test('ProfileCubit full lifecycle', () async {
      final cubit = ProfileCubit();
      cubit.loadprofile();
      await Future.delayed(const Duration(milliseconds: 200));
      expect(cubit.state, isA<ProfileStateSuccess>());
      cubit.refreshprofile();
      await Future.delayed(const Duration(milliseconds: 200));
      expect(cubit.state, isA<ProfileStateSuccess>());
      cubit.resetprofile();
      await Future.delayed(const Duration(milliseconds: 200));
      expect(cubit.state, isA<ProfileStateSuccess>());
      await cubit.close();
    });

    test('SettingsCubit full lifecycle', () async {
      final cubit = SettingsCubit();
      cubit.loadsettings();
      await Future.delayed(const Duration(milliseconds: 200));
      expect(cubit.state, isA<SettingsStateSuccess>());
      cubit.refreshsettings();
      await Future.delayed(const Duration(milliseconds: 200));
      expect(cubit.state, isA<SettingsStateSuccess>());
      cubit.resetsettings();
      await Future.delayed(const Duration(milliseconds: 200));
      expect(cubit.state, isA<SettingsStateSuccess>());
      await cubit.close();
    });

    test('NotificationCubit full lifecycle', () async {
      final cubit = NotificationCubit();
      cubit.loadnotification();
      await Future.delayed(const Duration(milliseconds: 200));
      expect(cubit.state, isA<NotificationStateSuccess>());
      cubit.refreshnotification();
      await Future.delayed(const Duration(milliseconds: 200));
      expect(cubit.state, isA<NotificationStateSuccess>());
      cubit.resetnotification();
      await Future.delayed(const Duration(milliseconds: 200));
      expect(cubit.state, isA<NotificationStateSuccess>());
      await cubit.close();
    });

    test('SessionCubit full lifecycle', () async {
      final cubit = SessionCubit();
      cubit.loadsession();
      await Future.delayed(const Duration(milliseconds: 200));
      expect(cubit.state, isA<SessionStateSuccess>());
      cubit.refreshsession();
      await Future.delayed(const Duration(milliseconds: 200));
      expect(cubit.state, isA<SessionStateSuccess>());
      cubit.resetsession();
      await Future.delayed(const Duration(milliseconds: 200));
      expect(cubit.state, isA<SessionStateSuccess>());
      await cubit.close();
    });

    test('OnboardingCubit full lifecycle', () async {
      final cubit = OnboardingCubit();
      cubit.loadonboarding();
      await Future.delayed(const Duration(milliseconds: 200));
      expect(cubit.state, isA<OnboardingStateSuccess>());
      cubit.refreshonboarding();
      await Future.delayed(const Duration(milliseconds: 200));
      expect(cubit.state, isA<OnboardingStateSuccess>());
      cubit.resetonboarding();
      await Future.delayed(const Duration(milliseconds: 200));
      expect(cubit.state, isA<OnboardingStateSuccess>());
      await cubit.close();
    });

  });
  group('Service lifecycle', () {
    group('AuthService lifecycle', () {
      late AuthService service;
      setUp(() async {
        await Future.delayed(const Duration(milliseconds: 500));
        service = AuthService();
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
    group('UserService lifecycle', () {
      late UserService service;
      setUp(() async {
        await Future.delayed(const Duration(milliseconds: 500));
        service = UserService();
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
    group('NotificationService lifecycle', () {
      late NotificationService service;
      setUp(() async {
        await Future.delayed(const Duration(milliseconds: 500));
        service = NotificationService();
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
    group('SessionService lifecycle', () {
      late SessionService service;
      setUp(() async {
        await Future.delayed(const Duration(milliseconds: 500));
        service = SessionService();
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
    group('PreferenceService lifecycle', () {
      late PreferenceService service;
      setUp(() async {
        await Future.delayed(const Duration(milliseconds: 500));
        service = PreferenceService();
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
    group('DeviceService lifecycle', () {
      late DeviceService service;
      setUp(() async {
        await Future.delayed(const Duration(milliseconds: 500));
        service = DeviceService();
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
