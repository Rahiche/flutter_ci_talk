import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:payments/src/cubits/account_cubit.dart';

void main() {
  group('AccountCubit', () {
    test('initial state is AccountStateInitial', () {
      final cubit = AccountCubit();
      expect(cubit.state, isA<AccountStateInitial>());
      cubit.close();
    });

    blocTest<AccountCubit, AccountState>(
      'emits [Loading, Success] when loadaccount succeeds',
      build: () => AccountCubit(),
      act: (cubit) => cubit.loadaccount(),
      expect: () => [
        isA<AccountStateLoading>(),
        isA<AccountStateSuccess>(),
      ],
    );

    blocTest<AccountCubit, AccountState>(
      'emits [Loading, Success] when refreshaccount succeeds',
      build: () => AccountCubit(),
      act: (cubit) => cubit.refreshaccount(),
      expect: () => [
        isA<AccountStateLoading>(),
        isA<AccountStateSuccess>(),
      ],
    );

    blocTest<AccountCubit, AccountState>(
      'emits [Loading, Success] when resetaccount succeeds',
      build: () => AccountCubit(),
      act: (cubit) => cubit.resetaccount(),
      expect: () => [
        isA<AccountStateLoading>(),
        isA<AccountStateSuccess>(),
      ],
    );

  });
}
