import 'package:car_rental/Feature/auth/data/model/password_reset_response_model.dart';
import 'package:car_rental/Feature/auth/data/model/reset_password_request_model.dart';
import 'package:car_rental/Feature/auth/domain/repo/password_repo.dart';
import 'package:car_rental/Feature/auth/presentation/components/reset_password_success_widget.dart';
import 'package:car_rental/Feature/auth/presentation/components/email_code_verify_step.dart';
import 'package:car_rental/Feature/auth/presentation/components/email_verify_setp.dart';
import 'package:car_rental/Feature/auth/presentation/components/reset_new_password_setp.dart';
import 'package:car_rental/core/services/local_services/preference_manager.dart';
import 'package:car_rental/core/services/local_services/storage_key.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'password_reset_state.dart';

class PasswordResetController extends Cubit<PasswordResetState> {
  PasswordResetController({required PasswordRepo passwordRepo})
    : _passwordRepo = passwordRepo,
      super(PasswordResetInitialState());
  final PasswordRepo _passwordRepo;
  final GlobalKey<FormState> emailFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> codeFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> resetFormKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? email;
  String? code;
  String password = '', confirmPassword = '';
  PasswordResetResponseModel? passwordResetResponseModel;
  String? resetToken;
  final List<Widget> resetPasswordPages = [
    EmailVerificationStep(),
    EmailCodeVerifyStep(),
    ResetNewPasswordSetp(),
    ResetPasswordSuccessWidget(),
  ];
  final PageController pageController = PageController();
  int currentStep = 0;
  static PasswordResetController get(context) => BlocProvider.of(context);
  Future<void> sendResetCode({required String email}) async {
    emit(PasswordResetLoadingState());
    final response = await _passwordRepo.checkEmailToResetPassword(
      email: email,
    );
    response.fold(
      (failure) => emit(PasswordResetFailureState(failure.errorMessage)),
      (response) {
        PreferenceManegar().setString(
          StorageKey.forgotPasswordVerifiedCode,
          response.code,
        );
        resetToken = response.resetToken;
        emit(PasswordResetCodeSentState(response));
      },
    );
  }

  Future<void> verifyCode() async {
    emit(PasswordResetLoadingState());
    String correctCode =
        PreferenceManegar().getString(StorageKey.forgotPasswordVerifiedCode) ??
        '';
    final success = correctCode == code;
    if (success) {
      emit(PasswordResetVerifiedState());
    } else {
      emit(PasswordResetFailureState('Invalid Code'));
    }
  }

  Future<void> resetPassword() async {
    emit(PasswordResetLoadingState());
    final response = await _passwordRepo.resetPassword(
      resetPasswordRequestModel: ResetPasswordRequestModel(
        email: email!,
        code: code!,
        password: password,
        resetToken: resetToken!,
        confirmPassword: confirmPassword,
      ),
    );
    response.fold(
      (failure) {
        emit(PasswordResetFailureState(failure.errorMessage));
      },
      (response) {
        emit(PasswordResetSuccessState());
      },
    );
  }

  Future<void> resendCode() async {
    final response = await _passwordRepo.resendVerifyCode(email: email!);
    response.fold(
      (failure) => emit(PasswordResetFailureState(failure.errorMessage)),
      (response) {
        PreferenceManegar().setString(
          StorageKey.forgotPasswordVerifiedCode,
          response.code,
        );
        emit(PasswordResetCodeResentState(response));
      },
    );
  }

  void updateAutovalidateMode(AutovalidateMode autovalidateMode) {
    this.autovalidateMode = autovalidateMode;
    emit(PasswordResetInitialState());
  }

  void goToNextPage() {
    if (currentStep < resetPasswordPages.length - 1) {
      currentStep++;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (pageController.hasClients) {
          pageController.nextPage(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        }
      });
      emit(PasswordResetPageChangedState(currentStep));
    }
  }

  @override
  Future<void> close() {
    pageController.dispose();
    return super.close();
  }
}
