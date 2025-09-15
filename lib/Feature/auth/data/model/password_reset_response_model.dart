class PasswordResetResponseModel {
  final String message;
  final String code;
  final String resetToken;

  PasswordResetResponseModel({
    required this.message,
    required this.code,
    required this.resetToken,
  });

  factory PasswordResetResponseModel.fromJson(Map<String, dynamic> json) {
    return PasswordResetResponseModel(
      message: json['message'] as String? ?? '',
      code: json['code']?.toString() ?? '',
      resetToken: json['reset_token'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'code': code,
      'reset_token': resetToken,
    };
  }
}
