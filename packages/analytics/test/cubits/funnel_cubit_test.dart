import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:analytics/src/cubits/funnel_cubit.dart';

void main() {
  group('FunnelCubit', () {
    test('initial state is FunnelStateInitial', () {
      final cubit = FunnelCubit();
      expect(cubit.state, isA<FunnelStateInitial>());
      cubit.close();
    });

    blocTest<FunnelCubit, FunnelState>(
      'emits [Loading, Success] when loadfunnel succeeds',
      build: () => FunnelCubit(),
      act: (cubit) => cubit.loadfunnel(),
      expect: () => [
        isA<FunnelStateLoading>(),
        isA<FunnelStateSuccess>(),
      ],
    );

    blocTest<FunnelCubit, FunnelState>(
      'emits [Loading, Success] when refreshfunnel succeeds',
      build: () => FunnelCubit(),
      act: (cubit) => cubit.refreshfunnel(),
      expect: () => [
        isA<FunnelStateLoading>(),
        isA<FunnelStateSuccess>(),
      ],
    );

    blocTest<FunnelCubit, FunnelState>(
      'emits [Loading, Success] when resetfunnel succeeds',
      build: () => FunnelCubit(),
      act: (cubit) => cubit.resetfunnel(),
      expect: () => [
        isA<FunnelStateLoading>(),
        isA<FunnelStateSuccess>(),
      ],
    );

    test('completes full cycle with delay', () async {
      final cubit = FunnelCubit();
      await cubit.loadfunnel();
      expect(cubit.state, isA<FunnelStateSuccess>());
      await cubit.close();
    });

  });
}
