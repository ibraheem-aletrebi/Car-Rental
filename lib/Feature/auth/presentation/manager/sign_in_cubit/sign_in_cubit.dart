import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:car_rental/Feature/auth/data/model/auth_response.dart';
import 'package:car_rental/Feature/auth/data/model/token_model.dart';
import 'package:car_rental/Feature/auth/domain/repo/auth_repo.dart';
import 'package:car_rental/core/services/local_services/preference_manager.dart';
import 'package:car_rental/core/services/local_services/secure_storage_services.dart';
import 'package:car_rental/core/services/local_services/storage_key.dart';
import 'package:meta/meta.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit({required this.secureStorageService, required this.authRepo})
    : super(SignInInitial());
  final AuthRepo authRepo;
  final SecureStorageService secureStorageService;

  bool rememberMe = true;

  void toggleRememberMe(bool value) {
    rememberMe = value;
    emit(SignInRememberChanged(rememberMe));
  }

  Future<void> signIn({required String email, required String password}) async {
    emit(SignInLoading());

    var result = await authRepo.signIn(email: email, password: password);
    result.fold(
      (failure) {
        log(failure.errorMessage);
        emit(SignInError(failure.errorMessage));
      },
      (authResponse) async {
        await handleRememberMe(tokenModel: authResponse.tokenModel);
        emit(SignInSuccess(authResponse));
      },
    );
  }

  Future<void> handleRememberMe({required TokenModel tokenModel}) async {
    if (rememberMe) {
      await PreferenceManegar().setBool(StorageKey.isSignedIn, true);
      await secureStorageService.saveAccessToken(tokenModel.token);
      await secureStorageService.saveRefreshToken(tokenModel.refreshToken);
    } else {
      await PreferenceManegar().setBool(StorageKey.isSignedIn, false);
      await secureStorageService.deleteAccessToken();
      await secureStorageService.deleteRefreshToken();
    }
  }
}
