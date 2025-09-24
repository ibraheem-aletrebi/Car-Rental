import 'package:bloc/bloc.dart';
import 'package:car_rental/Feature/auth/data/model/auth_response.dart';
import 'package:car_rental/Feature/auth/data/model/register_request_model.dart';
import 'package:car_rental/Feature/auth/domain/repo/auth_repo.dart';
import 'package:meta/meta.dart';
part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.authRepo) : super(SignUpInitial());
  final AuthRepo authRepo;
  // late UserModel userModel;
  Future<void> signUp({
    required RegisterRequestModel registerRequestModel,
  
  
  }) async {
    emit(SignUpLoading());
    var result = await authRepo.signUp(
      registerRequestModel: registerRequestModel,
 
    );
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
