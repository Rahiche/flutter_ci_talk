import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

sealed class InvoiceState extends Equatable {
  const InvoiceState();
  @override
  List<Object?> get props => [];
}
class InvoiceStateInitial extends InvoiceState {}
class InvoiceStateLoading extends InvoiceState {}
class InvoiceStateSuccess extends InvoiceState {
  final String data;
  const InvoiceStateSuccess(this.data);
  @override
  List<Object?> get props => [data];
}
class InvoiceStateError extends InvoiceState {
  final String message;
  const InvoiceStateError(this.message);
  @override
  List<Object?> get props => [message];
}

class InvoiceCubit extends Cubit<InvoiceState> {
  InvoiceCubit() : super(InvoiceStateInitial());

  Future<void> loadinvoice() async {
    emit(InvoiceStateLoading());
    try {
      await Future.delayed(const Duration(milliseconds: 82));
      emit(const InvoiceStateSuccess('loadinvoice done'));
    } catch (e) {
      emit(InvoiceStateError(e.toString()));
    }
  }

  Future<void> refreshinvoice() async {
    emit(InvoiceStateLoading());
    try {
      await Future.delayed(const Duration(milliseconds: 82));
      emit(const InvoiceStateSuccess('refreshinvoice done'));
    } catch (e) {
      emit(InvoiceStateError(e.toString()));
    }
  }

  Future<void> resetinvoice() async {
    emit(InvoiceStateLoading());
    try {
      await Future.delayed(const Duration(milliseconds: 82));
      emit(const InvoiceStateSuccess('resetinvoice done'));
    } catch (e) {
      emit(InvoiceStateError(e.toString()));
    }
  }

}
