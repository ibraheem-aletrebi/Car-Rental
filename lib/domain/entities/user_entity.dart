import 'package:car_rental/Feature/auth/data/model/country_model.dart';
import 'package:car_rental/data/models/location_model.dart';

class UserProfileEntity {
  final int id;
  final String fullName;
  final String email;
  final String phone;
  final bool phoneIsVerified;
  final CountryModel country;
  final LocationModel location;
  final bool availableToCreateCar;

  const UserProfileEntity({
    required this.id,
    required this.fullName,
    required this.email,
    required this.phone,
    required this.phoneIsVerified,
    required this.country,
    required this.location,
    required this.availableToCreateCar,
  });
}
