import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

sealed class SettingsState extends Equatable {
  const SettingsState();
  @override
  List<Object?> get props => [];
}
class SettingsStateInitial extends SettingsState {}
class SettingsStateLoading extends SettingsState {}
class SettingsStateSuccess extends SettingsState {
  final String data;
  const SettingsStateSuccess(this.data);
  @override
  List<Object?> get props => [data];
}
class SettingsStateError extends SettingsState {
  final String message;
  const SettingsStateError(this.message);
  @override
  List<Object?> get props => [message];
}

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsStateInitial());

  Future<void> loadsettings() async {
    emit(SettingsStateLoading());
    try {
      await Future.delayed(const Duration(milliseconds: 61));
      emit(const SettingsStateSuccess('loadsettings done'));
    } catch (e) {
      emit(SettingsStateError(e.toString()));
    }
  }

  Future<void> refreshsettings() async {
    emit(SettingsStateLoading());
    try {
      await Future.delayed(const Duration(milliseconds: 61));
      emit(const SettingsStateSuccess('refreshsettings done'));
    } catch (e) {
      emit(SettingsStateError(e.toString()));
    }
  }

  Future<void> resetsettings() async {
    emit(SettingsStateLoading());
    try {
      await Future.delayed(const Duration(milliseconds: 61));
      emit(const SettingsStateSuccess('resetsettings done'));
    } catch (e) {
      emit(SettingsStateError(e.toString()));
    }
  }

}
