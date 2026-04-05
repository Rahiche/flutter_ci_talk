import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:core/src/cubits/locale_cubit.dart';

void main() {
  group('LocaleCubit', () {
    test('initial state is LocaleStateInitial', () {
      final cubit = LocaleCubit();
      expect(cubit.state, isA<LocaleStateInitial>());
      cubit.close();
    });

    blocTest<LocaleCubit, LocaleState>(
      'emits [Loading, Success] when loadlocale succeeds',
      build: () => LocaleCubit(),
      act: (cubit) => cubit.loadlocale(),
      expect: () => [
        isA<LocaleStateLoading>(),
        isA<LocaleStateSuccess>(),
      ],
    );

    blocTest<LocaleCubit, LocaleState>(
      'emits [Loading, Success] when refreshlocale succeeds',
      build: () => LocaleCubit(),
      act: (cubit) => cubit.refreshlocale(),
      expect: () => [
        isA<LocaleStateLoading>(),
        isA<LocaleStateSuccess>(),
      ],
    );

    blocTest<LocaleCubit, LocaleState>(
      'emits [Loading, Success] when resetlocale succeeds',
      build: () => LocaleCubit(),
      act: (cubit) => cubit.resetlocale(),
      expect: () => [
        isA<LocaleStateLoading>(),
        isA<LocaleStateSuccess>(),
      ],
    );

  });
}
