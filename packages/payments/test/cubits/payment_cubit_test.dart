import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:payments/src/cubits/payment_cubit.dart';

void main() {
  group('PaymentCubit', () {
    test('initial state is PaymentStateInitial', () {
      final cubit = PaymentCubit();
      expect(cubit.state, isA<PaymentStateInitial>());
      cubit.close();
    });

    blocTest<PaymentCubit, PaymentState>(
      'emits [Loading, Success] when loadpayment succeeds',
      build: () => PaymentCubit(),
      act: (cubit) => cubit.loadpayment(),
      expect: () => [
        isA<PaymentStateLoading>(),
        isA<PaymentStateSuccess>(),
      ],
    );

    blocTest<PaymentCubit, PaymentState>(
      'emits [Loading, Success] when refreshpayment succeeds',
      build: () => PaymentCubit(),
      act: (cubit) => cubit.refreshpayment(),
      expect: () => [
        isA<PaymentStateLoading>(),
        isA<PaymentStateSuccess>(),
      ],
    );

    blocTest<PaymentCubit, PaymentState>(
      'emits [Loading, Success] when resetpayment succeeds',
      build: () => PaymentCubit(),
      act: (cubit) => cubit.resetpayment(),
      expect: () => [
        isA<PaymentStateLoading>(),
        isA<PaymentStateSuccess>(),
      ],
    );

  });
}
