import 'package:car_rental/Feature/auth/data/model/verify_phone_response_model.dart';

import 'package:car_rental/Feature/auth/domain/repo/phone_verify_repo.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'verify_phone_state.dart';

class VerifyPhoneCubit extends Cubit<VerifyPhoneState> {
  VerifyPhoneCubit(this.phoneVerifyRepo) : super(VerifyPhoneInitial());
  final PhoneVerifyRepo phoneVerifyRepo;

  VerifyPhoneResponseModel? verifyPhoneResponseModel;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String otpCode = '';
  String? phone;
  static VerifyPhoneCubit get(context) => BlocProvider.of(context);

  void updatephone(String phone) {
    this.phone = phone;
    emit(VerifyPhoneInitial());
  }

  Future<void> sendOtp({required String phoneNumber}) async {
    var result = await phoneVerifyRepo.sendOtp(phoneNumber);
    result.fold(
      (failure) {
        return emit(VerifyPhoneError(failure.errorMessage));
      },
      (verifyPhoneResponseModel) {
        this.verifyPhoneResponseModel = verifyPhoneResponseModel;
        return emit(
          VerifyPhoneCodeSent(
            verifyPhoneResponseModel: verifyPhoneResponseModel,
          ),
        );
      },
    );
  }

  Future<void> resendOtp({required String phoneNumber}) async {
    var result = await phoneVerifyRepo.resendOtp(phoneNumber);
    result.fold(
      (failure) {
        return emit(VerifyPhoneError(failure.errorMessage));
      },
      (verifyPhoneResponseModel) {
        this.verifyPhoneResponseModel = verifyPhoneResponseModel;
        return emit(
          VerifyPhoneCodeSent(
            verifyPhoneResponseModel: verifyPhoneResponseModel,
          ),
        );
      },
    );
  }

  Future<void> verifyOtp({
    required String verifyToken,
    required String otp,
  }) async {
    emit(VerifyPhoneLoading());
    final result = await phoneVerifyRepo.verifyOtp(verifyToken, otp);
    result.fold(
      (failure) => emit(VerifyPhoneError(failure.errorMessage)),
      (_) => emit(VerifyPhoneVerified()),
    );
  }
}
