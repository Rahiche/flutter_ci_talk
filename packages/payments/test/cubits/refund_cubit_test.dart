import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:payments/src/cubits/refund_cubit.dart';

void main() {
  group('RefundCubit', () {
    test('initial state is RefundStateInitial', () {
      final cubit = RefundCubit();
      expect(cubit.state, isA<RefundStateInitial>());
      cubit.close();
    });

    blocTest<RefundCubit, RefundState>(
      'emits [Loading, Success] when loadrefund succeeds',
      build: () => RefundCubit(),
      act: (cubit) => cubit.loadrefund(),
      expect: () => [
        isA<RefundStateLoading>(),
        isA<RefundStateSuccess>(),
      ],
    );

    blocTest<RefundCubit, RefundState>(
      'emits [Loading, Success] when refreshrefund succeeds',
      build: () => RefundCubit(),
      act: (cubit) => cubit.refreshrefund(),
      expect: () => [
        isA<RefundStateLoading>(),
        isA<RefundStateSuccess>(),
      ],
    );

    blocTest<RefundCubit, RefundState>(
      'emits [Loading, Success] when resetrefund succeeds',
      build: () => RefundCubit(),
      act: (cubit) => cubit.resetrefund(),
      expect: () => [
        isA<RefundStateLoading>(),
        isA<RefundStateSuccess>(),
      ],
    );

  });
}
