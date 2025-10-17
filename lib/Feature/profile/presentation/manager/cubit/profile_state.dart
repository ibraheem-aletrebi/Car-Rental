part of 'profile_cubit.dart';

sealed class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

final class ProfileInitial extends ProfileState {}
final class ProfileUpdateLoading extends ProfileState {}
final class ProfileUpdateSuccess extends ProfileState {}
final class ProfileUpdateFailure extends ProfileState {
  final String errorMessage;
  const ProfileUpdateFailure(this.errorMessage);
}

final class ProfileImageLoading extends ProfileState {}
final class ProfileImageSuccess extends ProfileState {}
final class ProfileImageFailure extends ProfileState {
  final String errorMessage;
  const ProfileImageFailure(this.errorMessage);
}