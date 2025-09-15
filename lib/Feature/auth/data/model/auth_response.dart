import 'package:car_rental/Feature/auth/data/model/token_model.dart';
import 'package:car_rental/Feature/auth/data/model/user_model.dart';

class AuthResponseModel {
  final TokenModel tokenModel;
  final UserModel userModel;

  AuthResponseModel({required this.tokenModel, required this.userModel});

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) {
    return AuthResponseModel(
      tokenModel: TokenModel.fromJson(json['tokens']),
      userModel: UserModel.fromJson(json['user']),
    );
  }

  Map<String, dynamic> toJson() {
    return {'tokens': tokenModel.toJson(), 'user': userModel.toJson()};
  }
}
