import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

sealed class ConnectivityState extends Equatable {
  const ConnectivityState();
  @override
  List<Object?> get props => [];
}
class ConnectivityStateInitial extends ConnectivityState {}
class ConnectivityStateLoading extends ConnectivityState {}
class ConnectivityStateSuccess extends ConnectivityState {
  final String data;
  const ConnectivityStateSuccess(this.data);
  @override
  List<Object?> get props => [data];
}
class ConnectivityStateError extends ConnectivityState {
  final String message;
  const ConnectivityStateError(this.message);
  @override
  List<Object?> get props => [message];
}

class ConnectivityCubit extends Cubit<ConnectivityState> {
  ConnectivityCubit() : super(ConnectivityStateInitial());

  Future<void> loadconnectivity() async {
    emit(ConnectivityStateLoading());
    try {
      await Future.delayed(const Duration(milliseconds: 18));
      emit(const ConnectivityStateSuccess('loadconnectivity done'));
    } catch (e) {
      emit(ConnectivityStateError(e.toString()));
    }
  }

  Future<void> refreshconnectivity() async {
    emit(ConnectivityStateLoading());
    try {
      await Future.delayed(const Duration(milliseconds: 18));
      emit(const ConnectivityStateSuccess('refreshconnectivity done'));
    } catch (e) {
      emit(ConnectivityStateError(e.toString()));
    }
  }

  Future<void> resetconnectivity() async {
    emit(ConnectivityStateLoading());
    try {
      await Future.delayed(const Duration(milliseconds: 18));
      emit(const ConnectivityStateSuccess('resetconnectivity done'));
    } catch (e) {
      emit(ConnectivityStateError(e.toString()));
    }
  }

}
