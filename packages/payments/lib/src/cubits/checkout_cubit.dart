import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

sealed class CheckoutState extends Equatable {
  const CheckoutState();
  @override
  List<Object?> get props => [];
}
class CheckoutStateInitial extends CheckoutState {}
class CheckoutStateLoading extends CheckoutState {}
class CheckoutStateSuccess extends CheckoutState {
  final String data;
  const CheckoutStateSuccess(this.data);
  @override
  List<Object?> get props => [data];
}
class CheckoutStateError extends CheckoutState {
  final String message;
  const CheckoutStateError(this.message);
  @override
  List<Object?> get props => [message];
}

class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit() : super(CheckoutStateInitial());

  Future<void> loadcheckout() async {
    emit(CheckoutStateLoading());
    try {
      await Future.delayed(const Duration(milliseconds: 38));
      emit(const CheckoutStateSuccess('loadcheckout done'));
    } catch (e) {
      emit(CheckoutStateError(e.toString()));
    }
  }

  Future<void> refreshcheckout() async {
    emit(CheckoutStateLoading());
    try {
      await Future.delayed(const Duration(milliseconds: 38));
      emit(const CheckoutStateSuccess('refreshcheckout done'));
    } catch (e) {
      emit(CheckoutStateError(e.toString()));
    }
  }

  Future<void> resetcheckout() async {
    emit(CheckoutStateLoading());
    try {
      await Future.delayed(const Duration(milliseconds: 38));
      emit(const CheckoutStateSuccess('resetcheckout done'));
    } catch (e) {
      emit(CheckoutStateError(e.toString()));
    }
  }

}
