import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:app/src/cubits/onboarding_cubit.dart';

void main() {
  group('OnboardingCubit', () {
    test('initial state is OnboardingStateInitial', () {
      final cubit = OnboardingCubit();
      expect(cubit.state, isA<OnboardingStateInitial>());
      cubit.close();
    });

    blocTest<OnboardingCubit, OnboardingState>(
      'emits [Loading, Success] when loadonboarding succeeds',
      build: () => OnboardingCubit(),
      act: (cubit) => cubit.loadonboarding(),
      expect: () => [
        isA<OnboardingStateLoading>(),
        isA<OnboardingStateSuccess>(),
      ],
    );

    blocTest<OnboardingCubit, OnboardingState>(
      'emits [Loading, Success] when refreshonboarding succeeds',
      build: () => OnboardingCubit(),
      act: (cubit) => cubit.refreshonboarding(),
      expect: () => [
        isA<OnboardingStateLoading>(),
        isA<OnboardingStateSuccess>(),
      ],
    );

    blocTest<OnboardingCubit, OnboardingState>(
      'emits [Loading, Success] when resetonboarding succeeds',
      build: () => OnboardingCubit(),
      act: (cubit) => cubit.resetonboarding(),
      expect: () => [
        isA<OnboardingStateLoading>(),
        isA<OnboardingStateSuccess>(),
      ],
    );

    test('completes full cycle with delay', () async {
      final cubit = OnboardingCubit();
      cubit.loadonboarding();
      // delay removed
      expect(cubit.state, isA<OnboardingStateSuccess>());
      await cubit.close();
    });

  });
}
