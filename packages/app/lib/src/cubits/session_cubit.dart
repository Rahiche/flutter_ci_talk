import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

sealed class SessionState extends Equatable {
  const SessionState();
  @override
  List<Object?> get props => [];
}
class SessionStateInitial extends SessionState {}
class SessionStateLoading extends SessionState {}
class SessionStateSuccess extends SessionState {
  final String data;
  const SessionStateSuccess(this.data);
  @override
  List<Object?> get props => [data];
}
class SessionStateError extends SessionState {
  final String message;
  const SessionStateError(this.message);
  @override
  List<Object?> get props => [message];
}

class SessionCubit extends Cubit<SessionState> {
  SessionCubit() : super(SessionStateInitial());

  Future<void> loadsession() async {
    emit(SessionStateLoading());
    try {
      await Future.delayed(const Duration(milliseconds: 75));
      emit(const SessionStateSuccess('loadsession done'));
    } catch (e) {
      emit(SessionStateError(e.toString()));
    }
  }

  Future<void> refreshsession() async {
    emit(SessionStateLoading());
    try {
      await Future.delayed(const Duration(milliseconds: 75));
      emit(const SessionStateSuccess('refreshsession done'));
    } catch (e) {
      emit(SessionStateError(e.toString()));
    }
  }

  Future<void> resetsession() async {
    emit(SessionStateLoading());
    try {
      await Future.delayed(const Duration(milliseconds: 75));
      emit(const SessionStateSuccess('resetsession done'));
    } catch (e) {
      emit(SessionStateError(e.toString()));
    }
  }

}
