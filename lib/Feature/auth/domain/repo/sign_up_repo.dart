import 'package:car_rental/Feature/auth/data/model/auth_response.dart';
import 'package:car_rental/Feature/auth/data/model/sign_up_request_model.dart';
import 'package:car_rental/core/Error/failure.dart';
import 'package:dartz/dartz.dart';

abstract class SignUpRepo {
  Future<Either<Failure, AuthResponseModel>> signUp({
    required SignUpRequestModel signUpRequestModel,
  });
}
