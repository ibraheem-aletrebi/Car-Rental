import 'package:car_rental/Feature/auth/data/model/password_reset_response_model.dart';
import 'package:car_rental/Feature/auth/data/model/reset_password_request_model.dart';
import 'package:car_rental/Feature/auth/domain/repo/password_repo.dart';
import 'package:car_rental/core/services/local_services/preference_manager.dart';
import 'package:car_rental/core/services/local_services/storage_key.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  ForgotPasswordCubit(this.passwordRepo) : super(ForgotPasswordInitial());
  final PasswordRepo passwordRepo;
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? email;
  String? code;
  String password = '', confirmPassword = '';
  PasswordResetResponseModel? passwordResetResponseModel;
  static ForgotPasswordCubit get(context) => BlocProvider.of(context);
  Future<void> sendResetCode({required String email}) async {
    emit(ForgotPasswordLoading());
    final response = await passwordRepo.checkEmailToResetPassword(email: email);
    response.fold(
      (failure) => emit(ForgotPasswordError(failure.errorMessage)),
      (response) {
        PreferenceManegar().setString(
          StorageKey.forgotPasswordVerifiedCode,
          response.code,
        );
        emit(ForgotPasswordCodeSent(response));
      },
    );
  }

  Future<void> verifyCode({required String code}) async {
    emit(ForgotPasswordLoading());
    String correctCode =
        PreferenceManegar().getString(StorageKey.forgotPasswordVerifiedCode) ??
        '';
    final success = correctCode == code;
    if (success) {
      emit(ForgotPasswordVerified());
    } else {
      emit(ForgotPasswordError('Invalid Code'));
    }
  }

  Future<void> resetPassword() async {
    emit(ForgotPasswordLoading());
    final response = await passwordRepo.resetPassword(
      resetPasswordRequestModel: ResetPasswordRequestModel(
        email: email!,
        code: passwordResetResponseModel!.code,
        password: password,
        resetToken: passwordResetResponseModel!.resetToken,
        confirmPassword: confirmPassword,
      ),
    );
    response.fold(
      (failure) {
        emit(ForgotPasswordError(failure.errorMessage));
      },
      (response) {
        emit(ForgotPasswordSuccess());
      },
    );
  }

  Future<void> resendCode() async {
    final response = await passwordRepo.resendVerifyCode(email: email!);
    response.fold(
      (failure) => emit(ForgotPasswordError(failure.errorMessage)),
      (response) {
        PreferenceManegar().setString(
          StorageKey.forgotPasswordVerifiedCode,
          response.code,
        );
        emit(ForgotPasswordCodeSent(response));
      },
    );
  }

  void updateAutovalidateMode(AutovalidateMode autovalidateMode) {
    this.autovalidateMode = autovalidateMode;
    emit(ForgotPasswordInitial());
  }

  void updatePasswordResponse({required PasswordResetResponseModel response}) {
    passwordResetResponseModel = response;
    emit(ForgotPasswordInitial());
  }

  void updateConfirmPassword(String value) {
    confirmPassword = value;
    emit(ForgotPasswordInitial());
  }

  void updatePassword(String value) {
    password = value;
    emit(ForgotPasswordInitial());
  }

  void updateEmail(String value) {
    email = value;
    emit(ForgotPasswordInitial());
  }
}
