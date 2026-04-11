import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:app/src/cubits/profile_cubit.dart';

void main() {
  group('ProfileCubit', () {
    test('initial state is ProfileStateInitial', () {
      final cubit = ProfileCubit();
      expect(cubit.state, isA<ProfileStateInitial>());
      cubit.close();
    });

    blocTest<ProfileCubit, ProfileState>(
      'emits [Loading, Success] when loadprofile succeeds',
      build: () => ProfileCubit(),
      act: (cubit) => cubit.loadprofile(),
      expect: () => [
        isA<ProfileStateLoading>(),
        isA<ProfileStateSuccess>(),
      ],
    );

    blocTest<ProfileCubit, ProfileState>(
      'emits [Loading, Success] when refreshprofile succeeds',
      build: () => ProfileCubit(),
      act: (cubit) => cubit.refreshprofile(),
      expect: () => [
        isA<ProfileStateLoading>(),
        isA<ProfileStateSuccess>(),
      ],
    );

    blocTest<ProfileCubit, ProfileState>(
      'emits [Loading, Success] when resetprofile succeeds',
      build: () => ProfileCubit(),
      act: (cubit) => cubit.resetprofile(),
      expect: () => [
        isA<ProfileStateLoading>(),
        isA<ProfileStateSuccess>(),
      ],
    );

    test('completes full cycle with delay', () async {
      final cubit = ProfileCubit();
      cubit.loadprofile();
      await Future.delayed(const Duration(seconds: 1));
      expect(cubit.state, isA<ProfileStateSuccess>());
      await cubit.close();
    });

  });
}
