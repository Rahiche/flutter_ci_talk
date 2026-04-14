import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

sealed class PaymentState extends Equatable {
  const PaymentState();
  @override
  List<Object?> get props => [];
}
class PaymentStateInitial extends PaymentState {}
class PaymentStateLoading extends PaymentState {}
class PaymentStateSuccess extends PaymentState {
  final String data;
  const PaymentStateSuccess(this.data);
  @override
  List<Object?> get props => [data];
}
class PaymentStateError extends PaymentState {
  final String message;
  const PaymentStateError(this.message);
  @override
  List<Object?> get props => [message];
}

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit() : super(PaymentStateInitial());

  Future<void> loadpayment() async {
    emit(PaymentStateLoading());
    try {
      await Future.delayed(const Duration(milliseconds: 75));
      emit(const PaymentStateSuccess('loadpayment done'));
    } catch (e) {
      emit(PaymentStateError(e.toString()));
    }
  }

  Future<void> refreshpayment() async {
    emit(PaymentStateLoading());
    try {
      await Future.delayed(const Duration(milliseconds: 75));
      emit(const PaymentStateSuccess('refreshpayment done'));
    } catch (e) {
      emit(PaymentStateError(e.toString()));
    }
  }

  Future<void> resetpayment() async {
    emit(PaymentStateLoading());
    try {
      await Future.delayed(const Duration(milliseconds: 75));
      emit(const PaymentStateSuccess('resetpayment done'));
    } catch (e) {
      emit(PaymentStateError(e.toString()));
    }
  }

}
