import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

sealed class NavigationState extends Equatable {
  const NavigationState();
  @override
  List<Object?> get props => [];
}
class NavigationStateInitial extends NavigationState {}
class NavigationStateLoading extends NavigationState {}
class NavigationStateSuccess extends NavigationState {
  final String data;
  const NavigationStateSuccess(this.data);
  @override
  List<Object?> get props => [data];
}
class NavigationStateError extends NavigationState {
  final String message;
  const NavigationStateError(this.message);
  @override
  List<Object?> get props => [message];
}

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationStateInitial());

  Future<void> loadnavigation() async {
    emit(NavigationStateLoading());
    try {
      await Future.delayed(const Duration(milliseconds: 23));
      emit(const NavigationStateSuccess('loadnavigation done'));
    } catch (e) {
      emit(NavigationStateError(e.toString()));
    }
  }

  Future<void> refreshnavigation() async {
    emit(NavigationStateLoading());
    try {
      await Future.delayed(const Duration(milliseconds: 23));
      emit(const NavigationStateSuccess('refreshnavigation done'));
    } catch (e) {
      emit(NavigationStateError(e.toString()));
    }
  }

  Future<void> resetnavigation() async {
    emit(NavigationStateLoading());
    try {
      await Future.delayed(const Duration(milliseconds: 23));
      emit(const NavigationStateSuccess('resetnavigation done'));
    } catch (e) {
      emit(NavigationStateError(e.toString()));
    }
  }

}
