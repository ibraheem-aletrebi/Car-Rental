import 'package:car_rental/Feature/auth/data/model/country_model.dart';
import 'package:car_rental/core/entities/user_entity.dart';
import 'package:car_rental/core/models/location_model.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.id,
    required super.fullName,
    required super.email,
    required super.phone,
    required super.phoneIsVerified,
    required super.country,
    required super.location,
    required super.availableToCreateCar,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      fullName: json['full_name'],
      email: json['email'],
      phone: json['phone'],
      phoneIsVerified: json['phone_is_verified'],
      availableToCreateCar: json['available_to_create_car'],
      country: CountryModel.fromJson(json['country']),
      location: LocationModel.fromJson(json['location']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'full_name': fullName,
      'email': email,
      'phone': phone,
      'phone_is_verified': phoneIsVerified,
      'available_to_create_car': availableToCreateCar,
      'country': country.toJson(),
      'location': location.toJson(),
    };
  }

  UserEntity toEntity() => this;
}
