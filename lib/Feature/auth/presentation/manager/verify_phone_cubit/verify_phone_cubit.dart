import 'package:bloc/bloc.dart';
import 'package:car_rental/Feature/auth/data/model/verify_phone_response_model.dart';
import 'package:car_rental/Feature/auth/domain/repo/auth_repo.dart';
import 'package:meta/meta.dart';

part 'verify_phone_state.dart';

class VerifyPhoneCubit extends Cubit<VerifyPhoneState> {
  VerifyPhoneCubit(this.authRepo) : super(VerifyPhoneInitial());
  final AuthRepo authRepo;

  
  Future<void> verifyPhoneNumber({required String phoneNumber}) async {
    emit(VerifyPhoneLoading());
    var result = await authRepo.verifyPhoneNumber(phoneNumber: phoneNumber);
    result.fold(
      (failure) {
        return emit(VerifyPhoneError(failure.errorMessage));
      },
      (verifyPhoneResponseModel) {
        return emit(
          VerifyPhoneCodeSent(
            verifyPhoneResponseModel: verifyPhoneResponseModel,
          ),
        );
      },
    );
  }

  Future<void> verifyOtpCode({
    required String verifyToken,
    required String otp,
  }) async {
    emit(VerifyPhoneLoading());
    final result = await authRepo.verifyPhoneNumberOtp(
      verifyToken: verifyToken,
      otp: otp,
    );

    result.fold(
      (failure) => emit(VerifyPhoneError(failure.errorMessage)),
      (_) => emit(VerifyPhoneVerified()),
    );
  }
}
