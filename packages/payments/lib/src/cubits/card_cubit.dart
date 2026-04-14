import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

sealed class CardState extends Equatable {
  const CardState();
  @override
  List<Object?> get props => [];
}
class CardStateInitial extends CardState {}
class CardStateLoading extends CardState {}
class CardStateSuccess extends CardState {
  final String data;
  const CardStateSuccess(this.data);
  @override
  List<Object?> get props => [data];
}
class CardStateError extends CardState {
  final String message;
  const CardStateError(this.message);
  @override
  List<Object?> get props => [message];
}

class CardCubit extends Cubit<CardState> {
  CardCubit() : super(CardStateInitial());

  Future<void> loadcard() async {
    emit(CardStateLoading());
    try {
      await Future.delayed(const Duration(milliseconds: 96));
      emit(const CardStateSuccess('loadcard done'));
    } catch (e) {
      emit(CardStateError(e.toString()));
    }
  }

  Future<void> refreshcard() async {
    emit(CardStateLoading());
    try {
      await Future.delayed(const Duration(milliseconds: 96));
      emit(const CardStateSuccess('refreshcard done'));
    } catch (e) {
      emit(CardStateError(e.toString()));
    }
  }

  Future<void> resetcard() async {
    emit(CardStateLoading());
    try {
      await Future.delayed(const Duration(milliseconds: 96));
      emit(const CardStateSuccess('resetcard done'));
    } catch (e) {
      emit(CardStateError(e.toString()));
    }
  }

}
