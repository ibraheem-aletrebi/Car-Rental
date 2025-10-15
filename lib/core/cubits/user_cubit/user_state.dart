part of 'user_cubit.dart';

sealed class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

final class UserInitial extends UserState {}

final class UserLoading extends UserState {}

final class UserLoaded extends UserState {

}

final class UserError extends UserState {
  final String message;
  const UserError(this.message);
}

final class UserUpdateSuccess extends UserState {
  final String message;
  const UserUpdateSuccess(this.message);
}

final class UserUpdateFailure extends UserState {
  final String message;
  const UserUpdateFailure(this.message);
}

final class UserImageUploadSuccess extends UserState {
  final String imageUrl;
  const UserImageUploadSuccess(this.imageUrl);
}

final class UserImageUploadFailure extends UserState {
  final String message;
  const UserImageUploadFailure(this.message);
}
