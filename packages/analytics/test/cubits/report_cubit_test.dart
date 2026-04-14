import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:analytics/src/cubits/report_cubit.dart';

void main() {
  group('ReportCubit', () {
    test('initial state is ReportStateInitial', () {
      final cubit = ReportCubit();
      expect(cubit.state, isA<ReportStateInitial>());
      cubit.close();
    });

    blocTest<ReportCubit, ReportState>(
      'emits [Loading, Success] when loadreport succeeds',
      build: () => ReportCubit(),
      act: (cubit) => cubit.loadreport(),
      expect: () => [
        isA<ReportStateLoading>(),
        isA<ReportStateSuccess>(),
      ],
    );

    blocTest<ReportCubit, ReportState>(
      'emits [Loading, Success] when refreshreport succeeds',
      build: () => ReportCubit(),
      act: (cubit) => cubit.refreshreport(),
      expect: () => [
        isA<ReportStateLoading>(),
        isA<ReportStateSuccess>(),
      ],
    );

    blocTest<ReportCubit, ReportState>(
      'emits [Loading, Success] when resetreport succeeds',
      build: () => ReportCubit(),
      act: (cubit) => cubit.resetreport(),
      expect: () => [
        isA<ReportStateLoading>(),
        isA<ReportStateSuccess>(),
      ],
    );

  });
}
