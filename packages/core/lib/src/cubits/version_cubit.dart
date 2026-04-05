import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

sealed class VersionState extends Equatable {
  const VersionState();
  @override
  List<Object?> get props => [];
}
class VersionStateInitial extends VersionState {}
class VersionStateLoading extends VersionState {}
class VersionStateSuccess extends VersionState {
  final String data;
  const VersionStateSuccess(this.data);
  @override
  List<Object?> get props => [data];
}
class VersionStateError extends VersionState {
  final String message;
  const VersionStateError(this.message);
  @override
  List<Object?> get props => [message];
}

class VersionCubit extends Cubit<VersionState> {
  VersionCubit() : super(VersionStateInitial());

  Future<void> loadversion() async {
    emit(VersionStateLoading());
    try {
      await Future.delayed(const Duration(milliseconds: 75));
      emit(const VersionStateSuccess('loadversion done'));
    } catch (e) {
      emit(VersionStateError(e.toString()));
    }
  }

  Future<void> refreshversion() async {
    emit(VersionStateLoading());
    try {
      await Future.delayed(const Duration(milliseconds: 75));
      emit(const VersionStateSuccess('refreshversion done'));
    } catch (e) {
      emit(VersionStateError(e.toString()));
    }
  }

  Future<void> resetversion() async {
    emit(VersionStateLoading());
    try {
      await Future.delayed(const Duration(milliseconds: 75));
      emit(const VersionStateSuccess('resetversion done'));
    } catch (e) {
      emit(VersionStateError(e.toString()));
    }
  }

}
