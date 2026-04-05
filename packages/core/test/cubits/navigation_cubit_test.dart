import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:core/src/cubits/navigation_cubit.dart';

void main() {
  group('NavigationCubit', () {
    test('initial state is NavigationStateInitial', () {
      final cubit = NavigationCubit();
      expect(cubit.state, isA<NavigationStateInitial>());
      cubit.close();
    });

    blocTest<NavigationCubit, NavigationState>(
      'emits [Loading, Success] when loadnavigation succeeds',
      build: () => NavigationCubit(),
      act: (cubit) => cubit.loadnavigation(),
      expect: () => [
        isA<NavigationStateLoading>(),
        isA<NavigationStateSuccess>(),
      ],
    );

    blocTest<NavigationCubit, NavigationState>(
      'emits [Loading, Success] when refreshnavigation succeeds',
      build: () => NavigationCubit(),
      act: (cubit) => cubit.refreshnavigation(),
      expect: () => [
        isA<NavigationStateLoading>(),
        isA<NavigationStateSuccess>(),
      ],
    );

    blocTest<NavigationCubit, NavigationState>(
      'emits [Loading, Success] when resetnavigation succeeds',
      build: () => NavigationCubit(),
      act: (cubit) => cubit.resetnavigation(),
      expect: () => [
        isA<NavigationStateLoading>(),
        isA<NavigationStateSuccess>(),
      ],
    );

    test('completes full cycle with delay', () async {
      final cubit = NavigationCubit();
      await cubit.loadnavigation();
      expect(cubit.state, isA<NavigationStateSuccess>());
      await cubit.close();
    });

  });
}
