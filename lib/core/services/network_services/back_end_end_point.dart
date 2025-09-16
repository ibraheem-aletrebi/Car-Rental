abstract class BackEndEndPoint {
  static const String signInEndPoint = 'auth/login/';
  static const String signUpEndPoint = 'auth/register/';
  static const String logOutEndPoint = 'auth/logout/';
  static const String refreshTokenEndPoint = 'auth/token/refresh/';

  static const String verifyPhoneNumberEndPoint =
      'auth/phone/request_verify_code/';
  static const String verifyPhoneNumberOtpEndPoint =
      'auth/phone/confirm_verify_code/';

  static const String requestResetPasswordEndPoint = 'auth/forgot_password/';
  static const String resetPasswordEndPoint = 'auth/reset_password/';
  static const String countriesEndPoint = 'public/countries/';
}
