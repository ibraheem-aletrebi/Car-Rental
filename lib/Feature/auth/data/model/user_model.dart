import 'package:car_rental/Feature/auth/data/model/country_model.dart';

class UserModel {
  final String fullName;
  final String email;
  final String? phone;
  final CountryModel country;
  final bool phoneIsVerified;
  
  UserModel({
    required this.fullName,
    required this.email,
    this.phone,
    required this.country,
    this.phoneIsVerified = false,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      fullName: json['full_name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'],
      phoneIsVerified: json['phone_is_verified'] ?? false,
      country: CountryModel.fromJson(json['country']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'full_name': fullName,
      'email': email,
      'phone': phone,
      'phone_is_verified': phoneIsVerified,
      'country': country.toJson(),
    };
  }
}
