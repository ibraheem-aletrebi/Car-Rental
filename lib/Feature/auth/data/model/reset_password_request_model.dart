class ResetPasswordRequestModel {
  final String resetToken;
  final String code;
  final String email;
  final String password;
  final String confirmPassword;

  ResetPasswordRequestModel({required this.resetToken, required this.code, required this.email, required this.password, required this.confirmPassword});

  Map<String, dynamic> toJson() {
    return {
      'reset_token': resetToken,
      'code': code,
      'email': email,
      'password': password,
      'confirm_password': confirmPassword,
    };
  }


}
