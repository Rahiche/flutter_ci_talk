import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

sealed class DashboardState extends Equatable {
  const DashboardState();
  @override
  List<Object?> get props => [];
}
class DashboardStateInitial extends DashboardState {}
class DashboardStateLoading extends DashboardState {}
class DashboardStateSuccess extends DashboardState {
  final String data;
  const DashboardStateSuccess(this.data);
  @override
  List<Object?> get props => [data];
}
class DashboardStateError extends DashboardState {
  final String message;
  const DashboardStateError(this.message);
  @override
  List<Object?> get props => [message];
}

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit() : super(DashboardStateInitial());

  Future<void> loaddashboard() async {
    emit(DashboardStateLoading());
    try {
      await Future.delayed(const Duration(milliseconds: 68));
      emit(const DashboardStateSuccess('loaddashboard done'));
    } catch (e) {
      emit(DashboardStateError(e.toString()));
    }
  }

  Future<void> refreshdashboard() async {
    emit(DashboardStateLoading());
    try {
      await Future.delayed(const Duration(milliseconds: 68));
      emit(const DashboardStateSuccess('refreshdashboard done'));
    } catch (e) {
      emit(DashboardStateError(e.toString()));
    }
  }

  Future<void> resetdashboard() async {
    emit(DashboardStateLoading());
    try {
      await Future.delayed(const Duration(milliseconds: 68));
      emit(const DashboardStateSuccess('resetdashboard done'));
    } catch (e) {
      emit(DashboardStateError(e.toString()));
    }
  }

}
