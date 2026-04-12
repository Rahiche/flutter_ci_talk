import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:core/src/cubits/permission_cubit.dart';

void main() {
  group('PermissionCubit', () {
    test('initial state is PermissionStateInitial', () {
      final cubit = PermissionCubit();
      expect(cubit.state, isA<PermissionStateInitial>());
      cubit.close();
    });

    blocTest<PermissionCubit, PermissionState>(
      'emits [Loading, Success] when loadpermission succeeds',
      build: () => PermissionCubit(),
      act: (cubit) => cubit.loadpermission(),
      expect: () => [
        isA<PermissionStateLoading>(),
        isA<PermissionStateSuccess>(),
      ],
    );

    blocTest<PermissionCubit, PermissionState>(
      'emits [Loading, Success] when refreshpermission succeeds',
      build: () => PermissionCubit(),
      act: (cubit) => cubit.refreshpermission(),
      expect: () => [
        isA<PermissionStateLoading>(),
        isA<PermissionStateSuccess>(),
      ],
    );

    blocTest<PermissionCubit, PermissionState>(
      'emits [Loading, Success] when resetpermission succeeds',
      build: () => PermissionCubit(),
      act: (cubit) => cubit.resetpermission(),
      expect: () => [
        isA<PermissionStateLoading>(),
        isA<PermissionStateSuccess>(),
      ],
    );

    test('completes full cycle with delay', () async {
      final cubit = PermissionCubit();
      cubit.loadpermission();
      await Future.delayed(const Duration(milliseconds: 1500));
      expect(cubit.state, isA<PermissionStateSuccess>());
      await cubit.close();
    });

  });
}
