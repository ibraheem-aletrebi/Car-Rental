import 'package:car_rental/Feature/auth/data/model/auth_response.dart';
import 'package:car_rental/Feature/auth/data/model/country_model.dart';
import 'package:car_rental/Feature/auth/data/model/password_reset_response_model.dart';

import 'package:car_rental/Feature/auth/data/model/token_model.dart';
import 'package:car_rental/core/error/failure.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepo {
  Future<Either<Failure, AuthResponseModel>> signIn({
    required String email,
    required String password,
  });

  Future<Either<Failure, Unit>> logout();

  Future<Either<Failure, TokenModel>> refreshToken({
    required String refreshToken,
  });

  Future<Either<Failure, PasswordResetResponseModel>> requestResetPassword({
    required String email,
  });

  Future<Either<Failure, Unit>> resetPassword({
    required String resetToken,
    required String code,
    required String email,
    required String password,
    required String confirmPassword,
  });

  Future<Either<Failure, List<CountryModel>>> fetchCountries({
    required int page,
  });
}
