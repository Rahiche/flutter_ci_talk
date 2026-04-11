import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:payments/src/cubits/invoice_cubit.dart';

void main() {
  group('InvoiceCubit', () {
    test('initial state is InvoiceStateInitial', () {
      final cubit = InvoiceCubit();
      expect(cubit.state, isA<InvoiceStateInitial>());
      cubit.close();
    });

    blocTest<InvoiceCubit, InvoiceState>(
      'emits [Loading, Success] when loadinvoice succeeds',
      build: () => InvoiceCubit(),
      act: (cubit) => cubit.loadinvoice(),
      expect: () => [
        isA<InvoiceStateLoading>(),
        isA<InvoiceStateSuccess>(),
      ],
    );

    blocTest<InvoiceCubit, InvoiceState>(
      'emits [Loading, Success] when refreshinvoice succeeds',
      build: () => InvoiceCubit(),
      act: (cubit) => cubit.refreshinvoice(),
      expect: () => [
        isA<InvoiceStateLoading>(),
        isA<InvoiceStateSuccess>(),
      ],
    );

    blocTest<InvoiceCubit, InvoiceState>(
      'emits [Loading, Success] when resetinvoice succeeds',
      build: () => InvoiceCubit(),
      act: (cubit) => cubit.resetinvoice(),
      expect: () => [
        isA<InvoiceStateLoading>(),
        isA<InvoiceStateSuccess>(),
      ],
    );

    test('completes full cycle with delay', () async {
      final cubit = InvoiceCubit();
      cubit.loadinvoice();
      await Future.delayed(const Duration(milliseconds: 200));
      expect(cubit.state, isA<InvoiceStateSuccess>());
      await cubit.close();
    });

  });
}
