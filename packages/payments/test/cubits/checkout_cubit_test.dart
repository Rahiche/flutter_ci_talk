import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:payments/src/cubits/checkout_cubit.dart';

void main() {
  group('CheckoutCubit', () {
    test('initial state is CheckoutStateInitial', () {
      final cubit = CheckoutCubit();
      expect(cubit.state, isA<CheckoutStateInitial>());
      cubit.close();
    });

    blocTest<CheckoutCubit, CheckoutState>(
      'emits [Loading, Success] when loadcheckout succeeds',
      build: () => CheckoutCubit(),
      act: (cubit) => cubit.loadcheckout(),
      expect: () => [
        isA<CheckoutStateLoading>(),
        isA<CheckoutStateSuccess>(),
      ],
    );

    blocTest<CheckoutCubit, CheckoutState>(
      'emits [Loading, Success] when refreshcheckout succeeds',
      build: () => CheckoutCubit(),
      act: (cubit) => cubit.refreshcheckout(),
      expect: () => [
        isA<CheckoutStateLoading>(),
        isA<CheckoutStateSuccess>(),
      ],
    );

    blocTest<CheckoutCubit, CheckoutState>(
      'emits [Loading, Success] when resetcheckout succeeds',
      build: () => CheckoutCubit(),
      act: (cubit) => cubit.resetcheckout(),
      expect: () => [
        isA<CheckoutStateLoading>(),
        isA<CheckoutStateSuccess>(),
      ],
    );

    test('completes full cycle with delay', () async {
      final cubit = CheckoutCubit();
      await cubit.loadcheckout();
      expect(cubit.state, isA<CheckoutStateSuccess>());
      await cubit.close();
    });

  });
}
