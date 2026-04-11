import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

sealed class OnboardingState extends Equatable {
  const OnboardingState();
  @override
  List<Object?> get props => [];
}
class OnboardingStateInitial extends OnboardingState {}
class OnboardingStateLoading extends OnboardingState {}
class OnboardingStateSuccess extends OnboardingState {
  final String data;
  const OnboardingStateSuccess(this.data);
  @override
  List<Object?> get props => [data];
}
class OnboardingStateError extends OnboardingState {
  final String message;
  const OnboardingStateError(this.message);
  @override
  List<Object?> get props => [message];
}

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingStateInitial());

  Future<void> loadonboarding() async {
    emit(OnboardingStateLoading());
    try {
      await Future.delayed(const Duration(milliseconds: 28));
      emit(const OnboardingStateSuccess('loadonboarding done'));
    } catch (e) {
      emit(OnboardingStateError(e.toString()));
    }
  }

  Future<void> refreshonboarding() async {
    emit(OnboardingStateLoading());
    try {
      await Future.delayed(const Duration(milliseconds: 28));
      emit(const OnboardingStateSuccess('refreshonboarding done'));
    } catch (e) {
      emit(OnboardingStateError(e.toString()));
    }
  }

  Future<void> resetonboarding() async {
    emit(OnboardingStateLoading());
    try {
      await Future.delayed(const Duration(milliseconds: 28));
      emit(const OnboardingStateSuccess('resetonboarding done'));
    } catch (e) {
      emit(OnboardingStateError(e.toString()));
    }
  }

}
