import 'package:car_rental/Feature/auth/data/model/country_model.dart';
import 'package:car_rental/core/enums/avialable_add_car.dart';
import 'package:car_rental/domain/entities/user_entity.dart';
import 'package:car_rental/data/models/location_model.dart';

class UserProfileModel extends UserProfileEntity {
  UserProfileModel({
    required super.id,
    required super.fullName,
    required super.email,
    required super.phone,
    required super.phoneIsVerified,
    required super.country,
    required super.location,
    required super.availableToCreateCar,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    return UserProfileModel(
      id: json['id'],
      fullName: json['full_name'],
      email: json['email'],
      phone: json['phone'],
      phoneIsVerified: json['phone_is_verified'],
      availableToCreateCar: json['available_to_create_car']==true?AvailableToAddCar.yes:AvailableToAddCar.no,
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
      'available_to_create_car': availableToCreateCar==AvailableToAddCar.yes?1:0,
      'country': country.toJson(),
      'location': location.toJson(),
    };
  }

  UserProfileEntity toEntity() => this;
}
