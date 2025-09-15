import 'package:bloc/bloc.dart';
import 'package:car_rental/Feature/auth/data/model/auth_response.dart';
import 'package:car_rental/Feature/auth/data/model/user_model.dart';
import 'package:car_rental/Feature/auth/domain/repo/auth_repo.dart';
import 'package:meta/meta.dart';
part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.authRepo) : super(SignUpInitial());
  final AuthRepo authRepo;
  late UserModel userModel;
  Future<void> signUp({
    required UserModel userModel,
    required String password,
  }) async {
    emit(SignUpLoading());
    var result = await authRepo.signUp(
      userModel: userModel,
      password: password,
    );
    result.fold(
      (failure) {
        return emit(SignUpError(failure.errorMessage));
      },
      (tokenModel) {
        this.userModel = userModel;
        return emit(SignUpSuccess(tokenModel));
      },
    );
  }
}
