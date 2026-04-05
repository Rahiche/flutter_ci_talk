import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

sealed class ThemeState extends Equatable {
  const ThemeState();
  @override
  List<Object?> get props => [];
}
class ThemeStateInitial extends ThemeState {}
class ThemeStateLoading extends ThemeState {}
class ThemeStateSuccess extends ThemeState {
  final String data;
  const ThemeStateSuccess(this.data);
  @override
  List<Object?> get props => [data];
}
class ThemeStateError extends ThemeState {
  final String message;
  const ThemeStateError(this.message);
  @override
  List<Object?> get props => [message];
}

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeStateInitial());

  Future<void> loadtheme() async {
    emit(ThemeStateLoading());
    try {
      await Future.delayed(const Duration(milliseconds: 197));
      emit(const ThemeStateSuccess('loadtheme done'));
    } catch (e) {
      emit(ThemeStateError(e.toString()));
    }
  }

  Future<void> refreshtheme() async {
    emit(ThemeStateLoading());
    try {
      await Future.delayed(const Duration(milliseconds: 197));
      emit(const ThemeStateSuccess('refreshtheme done'));
    } catch (e) {
      emit(ThemeStateError(e.toString()));
    }
  }

  Future<void> resettheme() async {
    emit(ThemeStateLoading());
    try {
      await Future.delayed(const Duration(milliseconds: 197));
      emit(const ThemeStateSuccess('resettheme done'));
    } catch (e) {
      emit(ThemeStateError(e.toString()));
    }
  }

}
