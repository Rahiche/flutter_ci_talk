import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

sealed class FunnelState extends Equatable {
  const FunnelState();
  @override
  List<Object?> get props => [];
}
class FunnelStateInitial extends FunnelState {}
class FunnelStateLoading extends FunnelState {}
class FunnelStateSuccess extends FunnelState {
  final String data;
  const FunnelStateSuccess(this.data);
  @override
  List<Object?> get props => [data];
}
class FunnelStateError extends FunnelState {
  final String message;
  const FunnelStateError(this.message);
  @override
  List<Object?> get props => [message];
}

class FunnelCubit extends Cubit<FunnelState> {
  FunnelCubit() : super(FunnelStateInitial());

  Future<void> loadfunnel() async {
    emit(FunnelStateLoading());
    try {
      await Future.delayed(const Duration(milliseconds: 23));
      emit(const FunnelStateSuccess('loadfunnel done'));
    } catch (e) {
      emit(FunnelStateError(e.toString()));
    }
  }

  Future<void> refreshfunnel() async {
    emit(FunnelStateLoading());
    try {
      await Future.delayed(const Duration(milliseconds: 23));
      emit(const FunnelStateSuccess('refreshfunnel done'));
    } catch (e) {
      emit(FunnelStateError(e.toString()));
    }
  }

  Future<void> resetfunnel() async {
    emit(FunnelStateLoading());
    try {
      await Future.delayed(const Duration(milliseconds: 23));
      emit(const FunnelStateSuccess('resetfunnel done'));
    } catch (e) {
      emit(FunnelStateError(e.toString()));
    }
  }

}
