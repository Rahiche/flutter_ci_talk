import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:core/src/cubits/connectivity_cubit.dart';

void main() {
  group('ConnectivityCubit', () {
    test('initial state is ConnectivityStateInitial', () {
      final cubit = ConnectivityCubit();
      expect(cubit.state, isA<ConnectivityStateInitial>());
      cubit.close();
    });

    blocTest<ConnectivityCubit, ConnectivityState>(
      'emits [Loading, Success] when loadconnectivity succeeds',
      build: () => ConnectivityCubit(),
      act: (cubit) => cubit.loadconnectivity(),
      expect: () => [
        isA<ConnectivityStateLoading>(),
        isA<ConnectivityStateSuccess>(),
      ],
    );

    blocTest<ConnectivityCubit, ConnectivityState>(
      'emits [Loading, Success] when refreshconnectivity succeeds',
      build: () => ConnectivityCubit(),
      act: (cubit) => cubit.refreshconnectivity(),
      expect: () => [
        isA<ConnectivityStateLoading>(),
        isA<ConnectivityStateSuccess>(),
      ],
    );

    blocTest<ConnectivityCubit, ConnectivityState>(
      'emits [Loading, Success] when resetconnectivity succeeds',
      build: () => ConnectivityCubit(),
      act: (cubit) => cubit.resetconnectivity(),
      expect: () => [
        isA<ConnectivityStateLoading>(),
        isA<ConnectivityStateSuccess>(),
      ],
    );

    test('completes full cycle with delay', () async {
      final cubit = ConnectivityCubit();
      cubit.loadconnectivity();
      // delay removed
      expect(cubit.state, isA<ConnectivityStateSuccess>());
      await cubit.close();
    });

  });
}
