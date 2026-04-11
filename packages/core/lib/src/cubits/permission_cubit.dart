import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

sealed class PermissionState extends Equatable {
  const PermissionState();
  @override
  List<Object?> get props => [];
}
class PermissionStateInitial extends PermissionState {}
class PermissionStateLoading extends PermissionState {}
class PermissionStateSuccess extends PermissionState {
  final String data;
  const PermissionStateSuccess(this.data);
  @override
  List<Object?> get props => [data];
}
class PermissionStateError extends PermissionState {
  final String message;
  const PermissionStateError(this.message);
  @override
  List<Object?> get props => [message];
}

class PermissionCubit extends Cubit<PermissionState> {
  PermissionCubit() : super(PermissionStateInitial());

  Future<void> loadpermission() async {
    emit(PermissionStateLoading());
    try {
      await Future.delayed(const Duration(milliseconds: 28));
      emit(const PermissionStateSuccess('loadpermission done'));
    } catch (e) {
      emit(PermissionStateError(e.toString()));
    }
  }

  Future<void> refreshpermission() async {
    emit(PermissionStateLoading());
    try {
      await Future.delayed(const Duration(milliseconds: 28));
      emit(const PermissionStateSuccess('refreshpermission done'));
    } catch (e) {
      emit(PermissionStateError(e.toString()));
    }
  }

  Future<void> resetpermission() async {
    emit(PermissionStateLoading());
    try {
      await Future.delayed(const Duration(milliseconds: 28));
      emit(const PermissionStateSuccess('resetpermission done'));
    } catch (e) {
      emit(PermissionStateError(e.toString()));
    }
  }

}
