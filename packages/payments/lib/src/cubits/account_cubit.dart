import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

sealed class AccountState extends Equatable {
  const AccountState();
  @override
  List<Object?> get props => [];
}
class AccountStateInitial extends AccountState {}
class AccountStateLoading extends AccountState {}
class AccountStateSuccess extends AccountState {
  final String data;
  const AccountStateSuccess(this.data);
  @override
  List<Object?> get props => [data];
}
class AccountStateError extends AccountState {
  final String message;
  const AccountStateError(this.message);
  @override
  List<Object?> get props => [message];
}

class AccountCubit extends Cubit<AccountState> {
  AccountCubit() : super(AccountStateInitial());

  Future<void> loadaccount() async {
    emit(AccountStateLoading());
    try {
      await Future.delayed(const Duration(milliseconds: 31));
      emit(const AccountStateSuccess('loadaccount done'));
    } catch (e) {
      emit(AccountStateError(e.toString()));
    }
  }

  Future<void> refreshaccount() async {
    emit(AccountStateLoading());
    try {
      await Future.delayed(const Duration(milliseconds: 31));
      emit(const AccountStateSuccess('refreshaccount done'));
    } catch (e) {
      emit(AccountStateError(e.toString()));
    }
  }

  Future<void> resetaccount() async {
    emit(AccountStateLoading());
    try {
      await Future.delayed(const Duration(milliseconds: 31));
      emit(const AccountStateSuccess('resetaccount done'));
    } catch (e) {
      emit(AccountStateError(e.toString()));
    }
  }

}
