class RegisterRequestModel {
  final String fullName;
  final String email;
  final String password;
  final String phoneNumber;
  final int countryId;
  final int locationId;

  RegisterRequestModel({
    required this.email,
    required this.password,
    required this.fullName,
    required this.phoneNumber,
    required this.countryId,
    required this.locationId,
  });

  Map<String, dynamic> toJson() => {
    'full_name': fullName,
    'email': email,
    'password': password,
    'phone': phoneNumber,
    'country_id': countryId,
    'location_id': locationId,
  };
}
