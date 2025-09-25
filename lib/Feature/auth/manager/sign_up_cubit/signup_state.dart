part of 'signup_cubit.dart';

abstract class SignupState extends Equatable {
  const SignupState();

  @override
  List<Object> get props => [];
}

class SignupInitial extends SignupState {}

class SignupLoading extends SignupState {}

class SignupSuccess extends SignupState {
  final AuthResponseModel authResponseModel;
  const SignupSuccess(this.authResponseModel);

  @override
  List<Object> get props => [authResponseModel];
}

class SignupFailure extends SignupState {
  final String message;

  const SignupFailure(this.message);

  @override
  List<Object> get props => [message];
}

class SignupFormUpdated extends SignupState {
  final String? fullName;
  final String? email;
  final String? phone;
  final String? password;
  final CountryModel? country;
  final LocationResponseModel? location;
  final AvailableToAddCar availableToAddCar;

  const SignupFormUpdated({
    this.fullName,
    this.email,
    this.phone,
    this.password,
    this.country,
    this.location,
    this.availableToAddCar = AvailableToAddCar.no,
  });

  @override
  List<Object> get props => [
        fullName ?? '',
        email ?? '',
        phone ?? '',
        password ?? '',
        country ?? '',
        location ?? '',
        availableToAddCar,
      ];
}
