import 'dart:developer';

import 'package:car_rental/Feature/auth/data/model/password_reset_response_model.dart';
import 'package:car_rental/Feature/auth/data/model/reset_password_request_model.dart';
import 'package:car_rental/Feature/auth/domain/repo/password_repo.dart';
import 'package:car_rental/core/Error/failure.dart';
import 'package:car_rental/core/services/network_services/api_service.dart';
import 'package:car_rental/core/services/network_services/back_end_end_point.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class PasswordRepoImpl implements PasswordRepo {
  final ApiService _apiService;
  PasswordRepoImpl({required ApiService apiService}) : _apiService = apiService;

  @override
  Future<Either<Failure, PasswordResetResponseModel>>
  checkEmailToResetPassword({required String email}) async {
    try {
      var response = await _apiService.post(
        endPoint: BackEndEndPoint.requestResetPasswordEndPoint,
        data: {'email': email},
      );
      log(response.toString());
      return right(PasswordResetResponseModel.fromJson(response));
    } catch (e) {
      log(
        'error: ${e.toString()} From -> auth repo imp request reset password',
      );
      if ((e is DioException)) {
        return left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> resetPassword({
    required ResetPasswordRequestModel resetPasswordRequestModel,
  }) async {
    try {
      var response = await _apiService.post(
        endPoint: BackEndEndPoint.resetPasswordEndPoint,
        data: resetPasswordRequestModel.toJson(),
        options: Options(
          headers: {
            'Authorization': 'Bearer ${resetPasswordRequestModel.resetToken}',
          },
        ),
      );
      log(response.toString());
      // return right(PasswordResetResponseModel.fromJson(response));
      return right(unit);
    } catch (e) {
      log('error: ${e.toString()} From -> auth repo imp reset password');
      if ((e is DioException)) {
        return left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, PasswordResetResponseModel>> resendVerifyCode({
    required String email,
  }) async {
    try {
      var response = await _apiService.post(
        endPoint: BackEndEndPoint.requestResetPasswordEndPoint,
        data: {'email': email},
      );
      log(response.toString());
      return right(PasswordResetResponseModel.fromJson(response));
    } catch (e) {
      log(
        'error: ${e.toString()} From -> auth repo imp request resend email Verify code',
      );
      if ((e is DioException)) {
        return left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
