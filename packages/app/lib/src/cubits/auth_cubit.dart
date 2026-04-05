import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

sealed class AuthState extends Equatable {
  const AuthState();
  @override
  List<Object?> get props => [];
}
class AuthStateInitial extends AuthState {}
class AuthStateLoading extends AuthState {}
class AuthStateSuccess extends AuthState {
  final String data;
  const AuthStateSuccess(this.data);
  @override
  List<Object?> get props => [data];
}
class AuthStateError extends AuthState {
  final String message;
  const AuthStateError(this.message);
  @override
  List<Object?> get props => [message];
}

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthStateInitial());

  Future<void> loadauth() async {
    emit(AuthStateLoading());
    try {
      await Future.delayed(const Duration(milliseconds: 197));
      emit(const AuthStateSuccess('loadauth done'));
    } catch (e) {
      emit(AuthStateError(e.toString()));
    }
  }

  Future<void> refreshauth() async {
    emit(AuthStateLoading());
    try {
      await Future.delayed(const Duration(milliseconds: 197));
      emit(const AuthStateSuccess('refreshauth done'));
    } catch (e) {
      emit(AuthStateError(e.toString()));
    }
  }

  Future<void> resetauth() async {
    emit(AuthStateLoading());
    try {
      await Future.delayed(const Duration(milliseconds: 197));
      emit(const AuthStateSuccess('resetauth done'));
    } catch (e) {
      emit(AuthStateError(e.toString()));
    }
  }

}
