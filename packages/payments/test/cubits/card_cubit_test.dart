import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:payments/src/cubits/card_cubit.dart';

void main() {
  group('CardCubit', () {
    test('initial state is CardStateInitial', () {
      final cubit = CardCubit();
      expect(cubit.state, isA<CardStateInitial>());
      cubit.close();
    });

    blocTest<CardCubit, CardState>(
      'emits [Loading, Success] when loadcard succeeds',
      build: () => CardCubit(),
      act: (cubit) => cubit.loadcard(),
      expect: () => [
        isA<CardStateLoading>(),
        isA<CardStateSuccess>(),
      ],
    );

    blocTest<CardCubit, CardState>(
      'emits [Loading, Success] when refreshcard succeeds',
      build: () => CardCubit(),
      act: (cubit) => cubit.refreshcard(),
      expect: () => [
        isA<CardStateLoading>(),
        isA<CardStateSuccess>(),
      ],
    );

    blocTest<CardCubit, CardState>(
      'emits [Loading, Success] when resetcard succeeds',
      build: () => CardCubit(),
      act: (cubit) => cubit.resetcard(),
      expect: () => [
        isA<CardStateLoading>(),
        isA<CardStateSuccess>(),
      ],
    );

    test('completes full cycle with delay', () async {
      final cubit = CardCubit();
      cubit.loadcard();
      // delay removed
      expect(cubit.state, isA<CardStateSuccess>());
      await cubit.close();
    });

  });
}
