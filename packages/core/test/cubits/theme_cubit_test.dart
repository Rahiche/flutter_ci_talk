import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:core/src/cubits/theme_cubit.dart';

void main() {
  group('ThemeCubit', () {
    test('initial state is ThemeStateInitial', () {
      final cubit = ThemeCubit();
      expect(cubit.state, isA<ThemeStateInitial>());
      cubit.close();
    });

    blocTest<ThemeCubit, ThemeState>(
      'emits [Loading, Success] when loadtheme succeeds',
      build: () => ThemeCubit(),
      act: (cubit) => cubit.loadtheme(),
      expect: () => [
        isA<ThemeStateLoading>(),
        isA<ThemeStateSuccess>(),
      ],
    );

    blocTest<ThemeCubit, ThemeState>(
      'emits [Loading, Success] when refreshtheme succeeds',
      build: () => ThemeCubit(),
      act: (cubit) => cubit.refreshtheme(),
      expect: () => [
        isA<ThemeStateLoading>(),
        isA<ThemeStateSuccess>(),
      ],
    );

    blocTest<ThemeCubit, ThemeState>(
      'emits [Loading, Success] when resettheme succeeds',
      build: () => ThemeCubit(),
      act: (cubit) => cubit.resettheme(),
      expect: () => [
        isA<ThemeStateLoading>(),
        isA<ThemeStateSuccess>(),
      ],
    );

  });
}
