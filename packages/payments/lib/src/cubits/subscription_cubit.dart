import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

sealed class SubscriptionState extends Equatable {
  const SubscriptionState();
  @override
  List<Object?> get props => [];
}
class SubscriptionStateInitial extends SubscriptionState {}
class SubscriptionStateLoading extends SubscriptionState {}
class SubscriptionStateSuccess extends SubscriptionState {
  final String data;
  const SubscriptionStateSuccess(this.data);
  @override
  List<Object?> get props => [data];
}
class SubscriptionStateError extends SubscriptionState {
  final String message;
  const SubscriptionStateError(this.message);
  @override
  List<Object?> get props => [message];
}

class SubscriptionCubit extends Cubit<SubscriptionState> {
  SubscriptionCubit() : super(SubscriptionStateInitial());

  Future<void> loadsubscription() async {
    emit(SubscriptionStateLoading());
    try {
      await Future.delayed(const Duration(milliseconds: 103));
      emit(const SubscriptionStateSuccess('loadsubscription done'));
    } catch (e) {
      emit(SubscriptionStateError(e.toString()));
    }
  }

  Future<void> refreshsubscription() async {
    emit(SubscriptionStateLoading());
    try {
      await Future.delayed(const Duration(milliseconds: 103));
      emit(const SubscriptionStateSuccess('refreshsubscription done'));
    } catch (e) {
      emit(SubscriptionStateError(e.toString()));
    }
  }

  Future<void> resetsubscription() async {
    emit(SubscriptionStateLoading());
    try {
      await Future.delayed(const Duration(milliseconds: 103));
      emit(const SubscriptionStateSuccess('resetsubscription done'));
    } catch (e) {
      emit(SubscriptionStateError(e.toString()));
    }
  }

}
