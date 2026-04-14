import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:app/src/cubits/settings_cubit.dart';

void main() {
  group('SettingsCubit', () {
    test('initial state is SettingsStateInitial', () {
      final cubit = SettingsCubit();
      expect(cubit.state, isA<SettingsStateInitial>());
      cubit.close();
    });

    blocTest<SettingsCubit, SettingsState>(
      'emits [Loading, Success] when loadsettings succeeds',
      build: () => SettingsCubit(),
      act: (cubit) => cubit.loadsettings(),
      expect: () => [
        isA<SettingsStateLoading>(),
        isA<SettingsStateSuccess>(),
      ],
    );

    blocTest<SettingsCubit, SettingsState>(
      'emits [Loading, Success] when refreshsettings succeeds',
      build: () => SettingsCubit(),
      act: (cubit) => cubit.refreshsettings(),
      expect: () => [
        isA<SettingsStateLoading>(),
        isA<SettingsStateSuccess>(),
      ],
    );

    blocTest<SettingsCubit, SettingsState>(
      'emits [Loading, Success] when resetsettings succeeds',
      build: () => SettingsCubit(),
      act: (cubit) => cubit.resetsettings(),
      expect: () => [
        isA<SettingsStateLoading>(),
        isA<SettingsStateSuccess>(),
      ],
    );

  });
}
