import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

sealed class RealTimeState extends Equatable {
  const RealTimeState();
  @override
  List<Object?> get props => [];
}
class RealTimeStateInitial extends RealTimeState {}
class RealTimeStateLoading extends RealTimeState {}
class RealTimeStateSuccess extends RealTimeState {
  final String data;
  const RealTimeStateSuccess(this.data);
  @override
  List<Object?> get props => [data];
}
class RealTimeStateError extends RealTimeState {
  final String message;
  const RealTimeStateError(this.message);
  @override
  List<Object?> get props => [message];
}

class RealTimeCubit extends Cubit<RealTimeState> {
  RealTimeCubit() : super(RealTimeStateInitial());

  Future<void> loadrealtime() async {
    emit(RealTimeStateLoading());
    try {
      await Future.delayed(const Duration(milliseconds: 82));
      emit(const RealTimeStateSuccess('loadrealtime done'));
    } catch (e) {
      emit(RealTimeStateError(e.toString()));
    }
  }

  Future<void> refreshrealtime() async {
    emit(RealTimeStateLoading());
    try {
      await Future.delayed(const Duration(milliseconds: 82));
      emit(const RealTimeStateSuccess('refreshrealtime done'));
    } catch (e) {
      emit(RealTimeStateError(e.toString()));
    }
  }

  Future<void> resetrealtime() async {
    emit(RealTimeStateLoading());
    try {
      await Future.delayed(const Duration(milliseconds: 82));
      emit(const RealTimeStateSuccess('resetrealtime done'));
    } catch (e) {
      emit(RealTimeStateError(e.toString()));
    }
  }

}
