import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

sealed class EventsState extends Equatable {
  const EventsState();
  @override
  List<Object?> get props => [];
}
class EventsStateInitial extends EventsState {}
class EventsStateLoading extends EventsState {}
class EventsStateSuccess extends EventsState {
  final String data;
  const EventsStateSuccess(this.data);
  @override
  List<Object?> get props => [data];
}
class EventsStateError extends EventsState {
  final String message;
  const EventsStateError(this.message);
  @override
  List<Object?> get props => [message];
}

class EventsCubit extends Cubit<EventsState> {
  EventsCubit() : super(EventsStateInitial());

  Future<void> loadevents() async {
    emit(EventsStateLoading());
    try {
      await Future.delayed(const Duration(milliseconds: 54));
      emit(const EventsStateSuccess('loadevents done'));
    } catch (e) {
      emit(EventsStateError(e.toString()));
    }
  }

  Future<void> refreshevents() async {
    emit(EventsStateLoading());
    try {
      await Future.delayed(const Duration(milliseconds: 54));
      emit(const EventsStateSuccess('refreshevents done'));
    } catch (e) {
      emit(EventsStateError(e.toString()));
    }
  }

  Future<void> resetevents() async {
    emit(EventsStateLoading());
    try {
      await Future.delayed(const Duration(milliseconds: 54));
      emit(const EventsStateSuccess('resetevents done'));
    } catch (e) {
      emit(EventsStateError(e.toString()));
    }
  }

}
