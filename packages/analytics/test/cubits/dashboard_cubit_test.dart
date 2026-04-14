import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:analytics/src/cubits/dashboard_cubit.dart';

void main() {
  group('DashboardCubit', () {
    test('initial state is DashboardStateInitial', () {
      final cubit = DashboardCubit();
      expect(cubit.state, isA<DashboardStateInitial>());
      cubit.close();
    });

    blocTest<DashboardCubit, DashboardState>(
      'emits [Loading, Success] when loaddashboard succeeds',
      build: () => DashboardCubit(),
      act: (cubit) => cubit.loaddashboard(),
      expect: () => [
        isA<DashboardStateLoading>(),
        isA<DashboardStateSuccess>(),
      ],
    );

    blocTest<DashboardCubit, DashboardState>(
      'emits [Loading, Success] when refreshdashboard succeeds',
      build: () => DashboardCubit(),
      act: (cubit) => cubit.refreshdashboard(),
      expect: () => [
        isA<DashboardStateLoading>(),
        isA<DashboardStateSuccess>(),
      ],
    );

    blocTest<DashboardCubit, DashboardState>(
      'emits [Loading, Success] when resetdashboard succeeds',
      build: () => DashboardCubit(),
      act: (cubit) => cubit.resetdashboard(),
      expect: () => [
        isA<DashboardStateLoading>(),
        isA<DashboardStateSuccess>(),
      ],
    );

  });
}
