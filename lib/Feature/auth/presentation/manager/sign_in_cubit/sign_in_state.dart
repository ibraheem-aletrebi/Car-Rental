part of 'sign_in_cubit.dart';

@immutable
sealed class SignInState {}

final class SignInInitial extends SignInState {}

final class SignInLoading extends SignInState {}

final class SignInError extends SignInState {
  final String message;
  SignInError(this.message);
}

final class SignInSuccess extends SignInState {
  final AuthResponseModel authResponseModel;
  SignInSuccess(this.authResponseModel);
}

final class SignInRememberChanged extends SignInState {
  final bool rememberMe;
  SignInRememberChanged(this.rememberMe);
}