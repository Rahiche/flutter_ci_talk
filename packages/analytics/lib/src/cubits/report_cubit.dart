import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

sealed class ReportState extends Equatable {
  const ReportState();
  @override
  List<Object?> get props => [];
}
class ReportStateInitial extends ReportState {}
class ReportStateLoading extends ReportState {}
class ReportStateSuccess extends ReportState {
  final String data;
  const ReportStateSuccess(this.data);
  @override
  List<Object?> get props => [data];
}
class ReportStateError extends ReportState {
  final String message;
  const ReportStateError(this.message);
  @override
  List<Object?> get props => [message];
}

class ReportCubit extends Cubit<ReportState> {
  ReportCubit() : super(ReportStateInitial());

  Future<void> loadreport() async {
    emit(ReportStateLoading());
    try {
      await Future.delayed(const Duration(milliseconds: 21));
      emit(const ReportStateSuccess('loadreport done'));
    } catch (e) {
      emit(ReportStateError(e.toString()));
    }
  }

  Future<void> refreshreport() async {
    emit(ReportStateLoading());
    try {
      await Future.delayed(const Duration(milliseconds: 21));
      emit(const ReportStateSuccess('refreshreport done'));
    } catch (e) {
      emit(ReportStateError(e.toString()));
    }
  }

  Future<void> resetreport() async {
    emit(ReportStateLoading());
    try {
      await Future.delayed(const Duration(milliseconds: 21));
      emit(const ReportStateSuccess('resetreport done'));
    } catch (e) {
      emit(ReportStateError(e.toString()));
    }
  }

}
