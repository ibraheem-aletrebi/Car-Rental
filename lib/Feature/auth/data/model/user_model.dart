import 'package:car_rental/Feature/auth/data/model/country_model.dart';

class UserModel {
  final String fullName;
  final String email;
  final String? phone;
  final String password;
  final CountryModel? countryModel;

  UserModel(
    this.phone,
    this.countryModel, {
    required this.fullName,
    required this.email,
    required this.password,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      json['phone'],
      CountryModel.fromJson(json['country']),
      fullName: json['fullName'],
      email: json['email'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson(UserModel userModel) {
    return   {
      'phone': userModel.phone,
      'country': userModel.countryModel?.toJson(),
      'fullName': userModel.fullName,
      'email': userModel.email,
      'password': userModel.password,
    };
  }
}
