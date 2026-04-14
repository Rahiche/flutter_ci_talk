import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:app/src/cubits/auth_cubit.dart';

void main() {
  group('AuthCubit', () {
    test('initial state is AuthStateInitial', () {
      final cubit = AuthCubit();
      expect(cubit.state, isA<AuthStateInitial>());
      cubit.close();
    });

    blocTest<AuthCubit, AuthState>(
      'emits [Loading, Success] when loadauth succeeds',
      build: () => AuthCubit(),
      act: (cubit) => cubit.loadauth(),
      expect: () => [
        isA<AuthStateLoading>(),
        isA<AuthStateSuccess>(),
      ],
    );

    blocTest<AuthCubit, AuthState>(
      'emits [Loading, Success] when refreshauth succeeds',
      build: () => AuthCubit(),
      act: (cubit) => cubit.refreshauth(),
      expect: () => [
        isA<AuthStateLoading>(),
        isA<AuthStateSuccess>(),
      ],
    );

    blocTest<AuthCubit, AuthState>(
      'emits [Loading, Success] when resetauth succeeds',
      build: () => AuthCubit(),
      act: (cubit) => cubit.resetauth(),
      expect: () => [
        isA<AuthStateLoading>(),
        isA<AuthStateSuccess>(),
      ],
    );

  });
}
