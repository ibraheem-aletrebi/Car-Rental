class VerifyPhoneResponseModel {
  final String message;
  final String phone;
  final String verifyToken;

  VerifyPhoneResponseModel({
    required this.message,
    required this.phone,
    required this.verifyToken,
  });

  factory VerifyPhoneResponseModel.fromJson(Map<String, dynamic> json) {
    return VerifyPhoneResponseModel(
      message: json['message'] ?? '',
      phone: json['phone']?.toString() ?? '',
      verifyToken: json['verify_token'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {'message': message, 'phone': phone, 'verify_token': verifyToken};
  }
}
