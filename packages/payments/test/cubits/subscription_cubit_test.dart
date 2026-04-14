import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:payments/src/cubits/subscription_cubit.dart';

void main() {
  group('SubscriptionCubit', () {
    test('initial state is SubscriptionStateInitial', () {
      final cubit = SubscriptionCubit();
      expect(cubit.state, isA<SubscriptionStateInitial>());
      cubit.close();
    });

    blocTest<SubscriptionCubit, SubscriptionState>(
      'emits [Loading, Success] when loadsubscription succeeds',
      build: () => SubscriptionCubit(),
      act: (cubit) => cubit.loadsubscription(),
      expect: () => [
        isA<SubscriptionStateLoading>(),
        isA<SubscriptionStateSuccess>(),
      ],
    );

    blocTest<SubscriptionCubit, SubscriptionState>(
      'emits [Loading, Success] when refreshsubscription succeeds',
      build: () => SubscriptionCubit(),
      act: (cubit) => cubit.refreshsubscription(),
      expect: () => [
        isA<SubscriptionStateLoading>(),
        isA<SubscriptionStateSuccess>(),
      ],
    );

    blocTest<SubscriptionCubit, SubscriptionState>(
      'emits [Loading, Success] when resetsubscription succeeds',
      build: () => SubscriptionCubit(),
      act: (cubit) => cubit.resetsubscription(),
      expect: () => [
        isA<SubscriptionStateLoading>(),
        isA<SubscriptionStateSuccess>(),
      ],
    );

  });
}
