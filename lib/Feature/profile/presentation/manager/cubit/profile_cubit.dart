import 'package:bloc/bloc.dart';
import 'package:car_rental/Feature/auth/data/model/country_model.dart';
import 'package:car_rental/core/enums/avialable_add_car.dart';
import 'package:car_rental/data/models/location_model.dart';
import 'package:car_rental/domain/entities/user_entity.dart';
import 'package:car_rental/domain/repos/user_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this._repo) : super(ProfileInitial());
  final UserRepo _repo;
  late UserProfileEntity user;

  final GlobalKey<FormState> profileFormKey = GlobalKey<FormState>();
  final AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  Future<void> updateUserProfile() async {
    emit(ProfileUpdateLoading());
    var result = await _repo.updateUser(user);
    result.fold((failure) => emit(ProfileUpdateFailure(failure.errorMessage)), (
      user,
    ) {
      this.user = user;
      return emit(ProfileUpdateSuccess());
    });
  }

  void updateUser({
    String? fullName,
    String? email,
    String? phone,
    AvailableToAddCar? availableToAddCar,
    CountryModel? country,
    LocationModel? location,
  }) {
    user = UserProfileEntity(
      id: user.id,
      fullName: fullName ?? user.fullName,
      email: email ?? user.email,
      phone: phone ?? user.phone,
      phoneIsVerified: user.phoneIsVerified,
      availableToCreateCar: availableToAddCar ?? user.availableToCreateCar,
      country: country ?? user.country,
      location: location ?? user.location,
    );
  }
}
