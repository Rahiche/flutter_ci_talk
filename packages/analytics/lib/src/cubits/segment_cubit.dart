import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

sealed class SegmentState extends Equatable {
  const SegmentState();
  @override
  List<Object?> get props => [];
}
class SegmentStateInitial extends SegmentState {}
class SegmentStateLoading extends SegmentState {}
class SegmentStateSuccess extends SegmentState {
  final String data;
  const SegmentStateSuccess(this.data);
  @override
  List<Object?> get props => [data];
}
class SegmentStateError extends SegmentState {
  final String message;
  const SegmentStateError(this.message);
  @override
  List<Object?> get props => [message];
}

class SegmentCubit extends Cubit<SegmentState> {
  SegmentCubit() : super(SegmentStateInitial());

  Future<void> loadsegment() async {
    emit(SegmentStateLoading());
    try {
      await Future.delayed(const Duration(milliseconds: 75));
      emit(const SegmentStateSuccess('loadsegment done'));
    } catch (e) {
      emit(SegmentStateError(e.toString()));
    }
  }

  Future<void> refreshsegment() async {
    emit(SegmentStateLoading());
    try {
      await Future.delayed(const Duration(milliseconds: 75));
      emit(const SegmentStateSuccess('refreshsegment done'));
    } catch (e) {
      emit(SegmentStateError(e.toString()));
    }
  }

  Future<void> resetsegment() async {
    emit(SegmentStateLoading());
    try {
      await Future.delayed(const Duration(milliseconds: 75));
      emit(const SegmentStateSuccess('resetsegment done'));
    } catch (e) {
      emit(SegmentStateError(e.toString()));
    }
  }

}
