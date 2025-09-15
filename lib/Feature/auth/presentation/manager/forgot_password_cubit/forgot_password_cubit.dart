import 'package:bloc/bloc.dart';
import 'package:car_rental/Feature/auth/data/model/password_reset_response_model.dart';
import 'package:car_rental/Feature/auth/domain/repo/auth_repo.dart';
import 'package:car_rental/core/services/local_services/preference_manager.dart';
import 'package:car_rental/core/services/local_services/storage_key.dart';
import 'package:meta/meta.dart';

part 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  ForgotPasswordCubit(this.authRepo) : super(ForgotPasswordInitial());

  final AuthRepo authRepo;
  Future<void> sendResetCode({required String email}) async {
    emit(ForgotPasswordLoading());

    final response = await authRepo.requestResetPassword(email: email);

    response.fold(
      (failure) => emit(ForgotPasswordError(failure.errorMessage)),
      (response) {
        PreferenceManegar().setString(
          StorageKey.forgotPasswordVerifiedCode,
          response.code,
        );
        PreferenceManegar().setString(StorageKey.email, email);
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

  Future<void> resetPassword({
    required String code,
    required String resetToken,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    emit(ForgotPasswordLoading());
    final response = await authRepo.resetPassword(
      resetToken: resetToken,
      code: code,
      email: email,
      password: password,
      confirmPassword: confirmPassword,
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
}
