import 'package:bloc/bloc.dart';
import 'package:car_rental/Feature/auth/data/model/token_model.dart';
import 'package:car_rental/Feature/auth/data/model/user_model.dart';
import 'package:car_rental/Feature/auth/domain/repo/auth_repo.dart';
import 'package:meta/meta.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.authRepo) : super(SignUpInitial());
  final AuthRepo authRepo ;

  Future<void> signUp({required UserModel userModel}) async {
    emit(SignUpLoading());
    var result = await authRepo.signUp(userModel: userModel);
    result.fold(
      (failure) {
        return emit(SignUpError(failure.errorMessage));
      },
      (tokenModel) {
        return emit(SignUpSuccess(tokenModel));
      },
    );
  }
}
