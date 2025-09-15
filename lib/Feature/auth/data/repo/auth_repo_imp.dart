import 'dart:developer';

import 'package:car_rental/Feature/auth/data/model/auth_response.dart';
import 'package:car_rental/Feature/auth/data/model/password_reset_response_model.dart';
import 'package:car_rental/Feature/auth/data/model/token_model.dart';
import 'package:car_rental/Feature/auth/data/model/user_model.dart';
import 'package:car_rental/Feature/auth/data/model/verify_phone_response_model.dart';
import 'package:car_rental/Feature/auth/domain/repo/auth_repo.dart';
import 'package:car_rental/core/Error/failure.dart';
import 'package:car_rental/core/services/local_services/secure_storage_services.dart';
import 'package:car_rental/core/services/network_services/api_service.dart';
import 'package:car_rental/core/services/network_services/back_end_end_point.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class AuthRepoImp extends AuthRepo {
  final ApiService apiService;
  final SecureStorageService secureStorageService;

  AuthRepoImp({required this.secureStorageService, required this.apiService});
  @override
  Future<Either<Failure, AuthResponseModel>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      var response = await apiService.post(
        endPoint: BackEndEndPoint.signInEndPoint,
        data: {'email': email, 'password': password},
      );
      log(response.toString());
      return Right(AuthResponseModel.fromJson(response));
    } catch (e) {
      log('error: ${e.toString()} From -> auth repo imp sign in');
      if ((e is DioException)) {
        return left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> logout() {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, AuthResponseModel>> signUp({
    required UserModel userModel,
    required String password,
  }) async {
    try {
      var response = await apiService.post(
        endPoint: BackEndEndPoint.signUpEndPoint,
        data: {
          'phone': userModel.phone,
          'full_name': userModel.fullName,
          'email': userModel.email,
          'country_id': userModel.country.id,
          'password': password,
        },
      );
      return Right(AuthResponseModel.fromJson(response));
    } catch (e) {
      log('error: ${e.toString()} From -> auth repo imp sign up');
      if ((e is DioException)) {
        return left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, TokenModel>> refreshToken({
    required String refreshToken,
  }) async {
    try {
      var response = await apiService.post(
        endPoint: BackEndEndPoint.refreshTokenEndPoint,
        data: {'refresh': refreshToken},
      );
      return Right(TokenModel.fromJson(response));
    } catch (e) {
      log('error: ${e.toString()} From -> auth repo imp refresh token');
      if ((e is DioException)) {
        return left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, VerifyPhoneResponseModel>> verifyPhoneNumber({
    required String phoneNumber,
  }) async {
    try {
      String? accessToken = await secureStorageService.getAccessToken();

      var response = await apiService.post(
        endPoint: BackEndEndPoint.verifyPhoneNumberEndPoint,
        data: {'phone': phoneNumber},
        options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
      );
      return right(VerifyPhoneResponseModel.fromJson(response));
    } catch (e) {
      log('error: ${e.toString()} From -> auth repo imp verify phone number');
      if ((e is DioException)) {
        return left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, dynamic>> verifyPhoneNumberOtp({
    required String otp,
    required String verifyToken,
  }) async {
    try {
      var response = await apiService.post(
        endPoint: BackEndEndPoint.verifyPhoneNumberOtpEndPoint,
        data: {'code': otp, 'verify_token': verifyToken},
      );
      log(response.toString());
      return right(response);
    } catch (e) {
      log(
        'error: ${e.toString()} From -> auth repo imp verify phone number otp',
      );
      if ((e is DioException)) {
        return left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, PasswordResetResponseModel>> requestResetPassword({
    required String email,
  }) async {
    try {
      var response = await apiService.post(
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
    required String resetToken,
    required String code,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    try {
      var response = await apiService.post(
        endPoint: BackEndEndPoint.resetPasswordEndPoint,
        data: {
          'reset_token': resetToken,
          'code': code,
          'email': email,
          'password': password,
          'confirm_password': confirmPassword,
        },
        options: Options(headers: {'Authorization': 'Bearer $resetToken'}),
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
}
