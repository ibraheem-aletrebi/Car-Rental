import 'package:car_rental/Feature/auth/data/model/token_model.dart';
import 'package:car_rental/Feature/auth/data/model/user_model.dart';
import 'package:car_rental/core/Error/failure.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepo {
  Future<Either<Failure, TokenModel>> signIn({
    required String emailOrPhone,
    required String password,
  });
  Future<Either<Failure, TokenModel>> signUp({required UserModel userModel});
  Future<Either<Failure, Unit>> logout();

  Future<Either<Failure, TokenModel>> refreshToken({
    required String refreshToken,
  });

  
}
