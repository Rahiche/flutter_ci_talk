import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:core/src/cubits/version_cubit.dart';

void main() {
  group('VersionCubit', () {
    test('initial state is VersionStateInitial', () {
      final cubit = VersionCubit();
      expect(cubit.state, isA<VersionStateInitial>());
      cubit.close();
    });

    blocTest<VersionCubit, VersionState>(
      'emits [Loading, Success] when loadversion succeeds',
      build: () => VersionCubit(),
      act: (cubit) => cubit.loadversion(),
      expect: () => [
        isA<VersionStateLoading>(),
        isA<VersionStateSuccess>(),
      ],
    );

    blocTest<VersionCubit, VersionState>(
      'emits [Loading, Success] when refreshversion succeeds',
      build: () => VersionCubit(),
      act: (cubit) => cubit.refreshversion(),
      expect: () => [
        isA<VersionStateLoading>(),
        isA<VersionStateSuccess>(),
      ],
    );

    blocTest<VersionCubit, VersionState>(
      'emits [Loading, Success] when resetversion succeeds',
      build: () => VersionCubit(),
      act: (cubit) => cubit.resetversion(),
      expect: () => [
        isA<VersionStateLoading>(),
        isA<VersionStateSuccess>(),
      ],
    );

  });
}
