import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

sealed class NotificationState extends Equatable {
  const NotificationState();
  @override
  List<Object?> get props => [];
}
class NotificationStateInitial extends NotificationState {}
class NotificationStateLoading extends NotificationState {}
class NotificationStateSuccess extends NotificationState {
  final String data;
  const NotificationStateSuccess(this.data);
  @override
  List<Object?> get props => [data];
}
class NotificationStateError extends NotificationState {
  final String message;
  const NotificationStateError(this.message);
  @override
  List<Object?> get props => [message];
}

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(NotificationStateInitial());

  Future<void> loadnotification() async {
    emit(NotificationStateLoading());
    try {
      await Future.delayed(const Duration(milliseconds: 68));
      emit(const NotificationStateSuccess('loadnotification done'));
    } catch (e) {
      emit(NotificationStateError(e.toString()));
    }
  }

  Future<void> refreshnotification() async {
    emit(NotificationStateLoading());
    try {
      await Future.delayed(const Duration(milliseconds: 68));
      emit(const NotificationStateSuccess('refreshnotification done'));
    } catch (e) {
      emit(NotificationStateError(e.toString()));
    }
  }

  Future<void> resetnotification() async {
    emit(NotificationStateLoading());
    try {
      await Future.delayed(const Duration(milliseconds: 68));
      emit(const NotificationStateSuccess('resetnotification done'));
    } catch (e) {
      emit(NotificationStateError(e.toString()));
    }
  }

}
