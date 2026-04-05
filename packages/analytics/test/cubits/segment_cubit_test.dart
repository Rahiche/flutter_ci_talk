import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:analytics/src/cubits/segment_cubit.dart';

void main() {
  group('SegmentCubit', () {
    test('initial state is SegmentStateInitial', () {
      final cubit = SegmentCubit();
      expect(cubit.state, isA<SegmentStateInitial>());
      cubit.close();
    });

    blocTest<SegmentCubit, SegmentState>(
      'emits [Loading, Success] when loadsegment succeeds',
      build: () => SegmentCubit(),
      act: (cubit) => cubit.loadsegment(),
      expect: () => [
        isA<SegmentStateLoading>(),
        isA<SegmentStateSuccess>(),
      ],
    );

    blocTest<SegmentCubit, SegmentState>(
      'emits [Loading, Success] when refreshsegment succeeds',
      build: () => SegmentCubit(),
      act: (cubit) => cubit.refreshsegment(),
      expect: () => [
        isA<SegmentStateLoading>(),
        isA<SegmentStateSuccess>(),
      ],
    );

    blocTest<SegmentCubit, SegmentState>(
      'emits [Loading, Success] when resetsegment succeeds',
      build: () => SegmentCubit(),
      act: (cubit) => cubit.resetsegment(),
      expect: () => [
        isA<SegmentStateLoading>(),
        isA<SegmentStateSuccess>(),
      ],
    );

  });
}
