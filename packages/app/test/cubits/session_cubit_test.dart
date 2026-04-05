import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:app/src/cubits/session_cubit.dart';

void main() {
  group('SessionCubit', () {
    test('initial state is SessionStateInitial', () {
      final cubit = SessionCubit();
      expect(cubit.state, isA<SessionStateInitial>());
      cubit.close();
    });

    blocTest<SessionCubit, SessionState>(
      'emits [Loading, Success] when loadsession succeeds',
      build: () => SessionCubit(),
      act: (cubit) => cubit.loadsession(),
      expect: () => [
        isA<SessionStateLoading>(),
        isA<SessionStateSuccess>(),
      ],
    );

    blocTest<SessionCubit, SessionState>(
      'emits [Loading, Success] when refreshsession succeeds',
      build: () => SessionCubit(),
      act: (cubit) => cubit.refreshsession(),
      expect: () => [
        isA<SessionStateLoading>(),
        isA<SessionStateSuccess>(),
      ],
    );

    blocTest<SessionCubit, SessionState>(
      'emits [Loading, Success] when resetsession succeeds',
      build: () => SessionCubit(),
      act: (cubit) => cubit.resetsession(),
      expect: () => [
        isA<SessionStateLoading>(),
        isA<SessionStateSuccess>(),
      ],
    );

  });
}
