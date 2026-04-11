import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

sealed class LocaleState extends Equatable {
  const LocaleState();
  @override
  List<Object?> get props => [];
}
class LocaleStateInitial extends LocaleState {}
class LocaleStateLoading extends LocaleState {}
class LocaleStateSuccess extends LocaleState {
  final String data;
  const LocaleStateSuccess(this.data);
  @override
  List<Object?> get props => [data];
}
class LocaleStateError extends LocaleState {
  final String message;
  const LocaleStateError(this.message);
  @override
  List<Object?> get props => [message];
}

class LocaleCubit extends Cubit<LocaleState> {
  LocaleCubit() : super(LocaleStateInitial());

  Future<void> loadlocale() async {
    emit(LocaleStateLoading());
    try {
      await Future.delayed(const Duration(milliseconds: 21));
      emit(const LocaleStateSuccess('loadlocale done'));
    } catch (e) {
      emit(LocaleStateError(e.toString()));
    }
  }

  Future<void> refreshlocale() async {
    emit(LocaleStateLoading());
    try {
      await Future.delayed(const Duration(milliseconds: 21));
      emit(const LocaleStateSuccess('refreshlocale done'));
    } catch (e) {
      emit(LocaleStateError(e.toString()));
    }
  }

  Future<void> resetlocale() async {
    emit(LocaleStateLoading());
    try {
      await Future.delayed(const Duration(milliseconds: 21));
      emit(const LocaleStateSuccess('resetlocale done'));
    } catch (e) {
      emit(LocaleStateError(e.toString()));
    }
  }

}
