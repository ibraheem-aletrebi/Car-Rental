part of 'password_reset_controller.dart';

@immutable
sealed class PasswordResetState {}

final class PasswordResetInitialState extends PasswordResetState {}

final class PasswordResetLoadingState extends PasswordResetState {}

final class PasswordResetCodeSentState extends PasswordResetState {
  final PasswordResetResponseModel response;
  PasswordResetCodeSentState(this.response);
}

final class PasswordResetCodeResentState extends PasswordResetState {
  final PasswordResetResponseModel response;
  PasswordResetCodeResentState(this.response);
}

final class PasswordResetVerifiedState extends PasswordResetState {}

final class PasswordResetSuccessState extends PasswordResetState {}

final class PasswordResetFailureState extends PasswordResetState {
  final String message;
  PasswordResetFailureState(this.message);
}

final class PasswordResetPageChangedState extends PasswordResetState {
  final int index;
  PasswordResetPageChangedState(this.index);
}
