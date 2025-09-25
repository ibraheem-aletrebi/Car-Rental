import 'package:car_rental/Feature/auth/data/model/password_reset_response_model.dart';
import 'package:car_rental/Feature/auth/data/model/reset_password_request_model.dart';
import 'package:car_rental/core/Error/failure.dart';
import 'package:dartz/dartz.dart';

abstract class PasswordRepo {
  Future<Either<Failure, PasswordResetResponseModel>> checkEmailToResetPassword({
    required String email,
  });

    Future<Either<Failure, PasswordResetResponseModel>> resendVerifyCode({
    required String email,
  });
  Future<Either<Failure, Unit>> resetPassword({
    required ResetPasswordRequestModel resetPasswordRequestModel,
  });
}
