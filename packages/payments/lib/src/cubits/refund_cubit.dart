import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

sealed class RefundState extends Equatable {
  const RefundState();
  @override
  List<Object?> get props => [];
}
class RefundStateInitial extends RefundState {}
class RefundStateLoading extends RefundState {}
class RefundStateSuccess extends RefundState {
  final String data;
  const RefundStateSuccess(this.data);
  @override
  List<Object?> get props => [data];
}
class RefundStateError extends RefundState {
  final String message;
  const RefundStateError(this.message);
  @override
  List<Object?> get props => [message];
}

class RefundCubit extends Cubit<RefundState> {
  RefundCubit() : super(RefundStateInitial());

  Future<void> loadrefund() async {
    emit(RefundStateLoading());
    try {
      await Future.delayed(const Duration(milliseconds: 117));
      emit(const RefundStateSuccess('loadrefund done'));
    } catch (e) {
      emit(RefundStateError(e.toString()));
    }
  }

  Future<void> refreshrefund() async {
    emit(RefundStateLoading());
    try {
      await Future.delayed(const Duration(milliseconds: 117));
      emit(const RefundStateSuccess('refreshrefund done'));
    } catch (e) {
      emit(RefundStateError(e.toString()));
    }
  }

  Future<void> resetrefund() async {
    emit(RefundStateLoading());
    try {
      await Future.delayed(const Duration(milliseconds: 117));
      emit(const RefundStateSuccess('resetrefund done'));
    } catch (e) {
      emit(RefundStateError(e.toString()));
    }
  }

}
