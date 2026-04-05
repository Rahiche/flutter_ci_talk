import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:analytics/src/cubits/events_cubit.dart';

void main() {
  group('EventsCubit', () {
    test('initial state is EventsStateInitial', () {
      final cubit = EventsCubit();
      expect(cubit.state, isA<EventsStateInitial>());
      cubit.close();
    });

    blocTest<EventsCubit, EventsState>(
      'emits [Loading, Success] when loadevents succeeds',
      build: () => EventsCubit(),
      act: (cubit) => cubit.loadevents(),
      expect: () => [
        isA<EventsStateLoading>(),
        isA<EventsStateSuccess>(),
      ],
    );

    blocTest<EventsCubit, EventsState>(
      'emits [Loading, Success] when refreshevents succeeds',
      build: () => EventsCubit(),
      act: (cubit) => cubit.refreshevents(),
      expect: () => [
        isA<EventsStateLoading>(),
        isA<EventsStateSuccess>(),
      ],
    );

    blocTest<EventsCubit, EventsState>(
      'emits [Loading, Success] when resetevents succeeds',
      build: () => EventsCubit(),
      act: (cubit) => cubit.resetevents(),
      expect: () => [
        isA<EventsStateLoading>(),
        isA<EventsStateSuccess>(),
      ],
    );

    test('completes full cycle with delay', () async {
      final cubit = EventsCubit();
      cubit.loadevents();
      // delay removed
      expect(cubit.state, isA<EventsStateSuccess>());
      await cubit.close();
    });

  });
}
