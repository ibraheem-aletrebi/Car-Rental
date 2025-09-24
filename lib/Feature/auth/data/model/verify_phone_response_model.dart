class VerifyPhoneResponseModel {
  final String message;
  final String phone;
  final String verifyToken;
  final String code;

  VerifyPhoneResponseModel({
    required this.message,
    required this.phone,
    required this.verifyToken,
    required this.code,
  });

  factory VerifyPhoneResponseModel.fromJson(Map<String, dynamic> json) {
    return VerifyPhoneResponseModel(
      message: json['message'] ?? '',
      code: json['code'] ?? '',
      phone: json['phone']?.toString() ?? '',
      verifyToken: json['verify_token'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {'message': message, 'phone': phone, 'verify_token': verifyToken};
  }
}
