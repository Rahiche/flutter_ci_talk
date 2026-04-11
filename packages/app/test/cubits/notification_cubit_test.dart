import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:app/src/cubits/notification_cubit.dart';

void main() {
  group('NotificationCubit', () {
    test('initial state is NotificationStateInitial', () {
      final cubit = NotificationCubit();
      expect(cubit.state, isA<NotificationStateInitial>());
      cubit.close();
    });

    blocTest<NotificationCubit, NotificationState>(
      'emits [Loading, Success] when loadnotification succeeds',
      build: () => NotificationCubit(),
      act: (cubit) => cubit.loadnotification(),
      expect: () => [
        isA<NotificationStateLoading>(),
        isA<NotificationStateSuccess>(),
      ],
    );

    blocTest<NotificationCubit, NotificationState>(
      'emits [Loading, Success] when refreshnotification succeeds',
      build: () => NotificationCubit(),
      act: (cubit) => cubit.refreshnotification(),
      expect: () => [
        isA<NotificationStateLoading>(),
        isA<NotificationStateSuccess>(),
      ],
    );

    blocTest<NotificationCubit, NotificationState>(
      'emits [Loading, Success] when resetnotification succeeds',
      build: () => NotificationCubit(),
      act: (cubit) => cubit.resetnotification(),
      expect: () => [
        isA<NotificationStateLoading>(),
        isA<NotificationStateSuccess>(),
      ],
    );

    test('completes full cycle with delay', () async {
      final cubit = NotificationCubit();
      cubit.loadnotification();
      await Future.delayed(const Duration(seconds: 1));
      expect(cubit.state, isA<NotificationStateSuccess>());
      await cubit.close();
    });

  });
}
