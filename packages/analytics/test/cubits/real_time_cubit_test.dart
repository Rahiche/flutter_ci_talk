import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:analytics/src/cubits/real_time_cubit.dart';

void main() {
  group('RealTimeCubit', () {
    test('initial state is RealTimeStateInitial', () {
      final cubit = RealTimeCubit();
      expect(cubit.state, isA<RealTimeStateInitial>());
      cubit.close();
    });

    blocTest<RealTimeCubit, RealTimeState>(
      'emits [Loading, Success] when loadrealtime succeeds',
      build: () => RealTimeCubit(),
      act: (cubit) => cubit.loadrealtime(),
      expect: () => [
        isA<RealTimeStateLoading>(),
        isA<RealTimeStateSuccess>(),
      ],
    );

    blocTest<RealTimeCubit, RealTimeState>(
      'emits [Loading, Success] when refreshrealtime succeeds',
      build: () => RealTimeCubit(),
      act: (cubit) => cubit.refreshrealtime(),
      expect: () => [
        isA<RealTimeStateLoading>(),
        isA<RealTimeStateSuccess>(),
      ],
    );

    blocTest<RealTimeCubit, RealTimeState>(
      'emits [Loading, Success] when resetrealtime succeeds',
      build: () => RealTimeCubit(),
      act: (cubit) => cubit.resetrealtime(),
      expect: () => [
        isA<RealTimeStateLoading>(),
        isA<RealTimeStateSuccess>(),
      ],
    );

    test('completes full cycle with delay', () async {
      final cubit = RealTimeCubit();
      await cubit.loadrealtime();
      expect(cubit.state, isA<RealTimeStateSuccess>());
      await cubit.close();
    });

  });
}
