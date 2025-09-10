class TokenModel {
  final String token;
  final String refreshToken;
  TokenModel({required this.token, required this.refreshToken});

  factory TokenModel.fromJson(Map<String, dynamic> json) {
    return TokenModel(token: json['access'], refreshToken: json['refresh']);
  }

  Map<String, dynamic> toJson() {
    return {'access': token, 'refresh': refreshToken};
  }
}
