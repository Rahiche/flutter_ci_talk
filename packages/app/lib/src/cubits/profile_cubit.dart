import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

sealed class ProfileState extends Equatable {
  const ProfileState();
  @override
  List<Object?> get props => [];
}
class ProfileStateInitial extends ProfileState {}
class ProfileStateLoading extends ProfileState {}
class ProfileStateSuccess extends ProfileState {
  final String data;
  const ProfileStateSuccess(this.data);
  @override
  List<Object?> get props => [data];
}
class ProfileStateError extends ProfileState {
  final String message;
  const ProfileStateError(this.message);
  @override
  List<Object?> get props => [message];
}

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileStateInitial());

  Future<void> loadprofile() async {
    emit(ProfileStateLoading());
    try {
      await Future.delayed(const Duration(milliseconds: 18));
      emit(const ProfileStateSuccess('loadprofile done'));
    } catch (e) {
      emit(ProfileStateError(e.toString()));
    }
  }

  Future<void> refreshprofile() async {
    emit(ProfileStateLoading());
    try {
      await Future.delayed(const Duration(milliseconds: 18));
      emit(const ProfileStateSuccess('refreshprofile done'));
    } catch (e) {
      emit(ProfileStateError(e.toString()));
    }
  }

  Future<void> resetprofile() async {
    emit(ProfileStateLoading());
    try {
      await Future.delayed(const Duration(milliseconds: 18));
      emit(const ProfileStateSuccess('resetprofile done'));
    } catch (e) {
      emit(ProfileStateError(e.toString()));
    }
  }

}
