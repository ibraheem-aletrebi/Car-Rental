import 'package:car_rental/Feature/auth/data/model/country_model.dart';
import 'package:car_rental/Feature/auth/data/model/location_response_model.dart';
import 'package:car_rental/Feature/auth/data/model/sign_up_request_model.dart';
import 'package:car_rental/Feature/auth/domain/repo/sign_up_repo.dart';
import 'package:car_rental/core/enums/avialable_add_car.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit({required this.signUpRepo}) : super(SignupInitial());
  final SignUpRepo signUpRepo;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  String? fullName, email, phone, password;
  CountryModel? countryModel;
  LocationResponseModel? locationModel;
  AvailableToAddCar availableToAddCar = AvailableToAddCar.no;

  static SignupCubit get(BuildContext context) => BlocProvider.of(context);

  void toggleAutovalidateMode() {
    autovalidateMode = AutovalidateMode.always;
    emit(SignupFormUpdated(
      fullName: fullName,
      email: email,
      phone: phone,
      password: password,
      country: countryModel,
      location: locationModel,
      availableToAddCar: availableToAddCar,
    ));
  }

  void changeAvailableToAddCar(AvailableToAddCar value) {
    availableToAddCar = value;
    _emitUpdated();
  }

  void changeCountry(CountryModel countryModel) {
    this.countryModel = countryModel;
    _emitUpdated();
  }

  void changeLocation(LocationResponseModel locationModel) {
    this.locationModel = locationModel;
    _emitUpdated();
  }

  void changeFullName(String fullName) {
    this.fullName = fullName;
    _emitUpdated();
  }

  void changeEmail(String email) {
    this.email = email;
    _emitUpdated();
  }

  void changePhone(String phone) {
    this.phone = phone;
    _emitUpdated();
  }

  void changePassword(String password) {
    this.password = password;
    _emitUpdated();
  }




  void reset() {
    fullName = null;
    email = null;
    phone = null;
    password = null;
    countryModel = null;
    locationModel = null;
    availableToAddCar = AvailableToAddCar.no;
    autovalidateMode = AutovalidateMode.disabled;
    emit(SignupInitial());
  }

  Future<void> signUp({required SignUpRequestModel signUpRequestModel}) async {
    emit(SignupLoading());
    try {
      final result =
          await signUpRepo.signUp(signUpRequestModel: signUpRequestModel);

      result.fold(
        (failure) => emit(SignupFailure(failure.errorMessage)),
        (_) => emit(SignupSuccess()),
      );
    } catch (e) {
      emit(SignupFailure(e.toString()));
    }
  }

  void _emitUpdated() {
    emit(SignupFormUpdated(
      fullName: fullName,
      email: email,
      phone: phone,
      password: password,
      country: countryModel,
      location: locationModel,
      availableToAddCar: availableToAddCar,
    ));
  }
}
