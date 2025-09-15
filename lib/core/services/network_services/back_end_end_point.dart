abstract class BackEndEndPoint {
  static const String signInEndPoint = 'login/';
  static const String signUpEndPoint = 'register/';
  static const String logOutEndPoint = 'logout/';
  static const String refreshTokenEndPoint = 'token/refresh/';

  static const String verifyPhoneNumberEndPoint = 'phone/request_verify_code/';
  static const String verifyPhoneNumberOtpEndPoint =
      'phone/confirm_verify_code/';
  // static const String resendPhoneNumberOtpEndPoint = 'phone/request_verify_code/';

  static const String requestResetPasswordEndPoint = 'forgot_password/';
  static const String resetPasswordEndPoint = 'reset_password/';
}
