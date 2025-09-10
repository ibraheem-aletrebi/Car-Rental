import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:car_rental/Feature/auth/data/model/token_model.dart';
import 'package:car_rental/Feature/auth/domain/repo/auth_repo.dart';
import 'package:meta/meta.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit({required this.authRepo}) : super(SignInInitial());
  final AuthRepo authRepo;
  void signIn({required String emailOrPhone, required String password}) async {
    emit(SignInLoading());
    var result = await authRepo.signIn(
      emailOrPhone: emailOrPhone,
      password: password,
    );

    result.fold(
      (failure) {
        log(failure.errorMessage);
        return emit(SignInError(failure.errorMessage));
      },
      (tokenModel) {
        return emit(SignInSuccess(tokenModel));
      },
    );
  }
}
