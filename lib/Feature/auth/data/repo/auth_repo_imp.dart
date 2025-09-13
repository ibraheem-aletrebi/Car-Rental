import 'dart:developer';

import 'package:car_rental/Feature/auth/data/model/token_model.dart';
import 'package:car_rental/Feature/auth/data/model/user_model.dart';
import 'package:car_rental/Feature/auth/domain/repo/auth_repo.dart';
import 'package:car_rental/core/Error/failure.dart';
import 'package:car_rental/core/services/network_services/api_service.dart';
import 'package:car_rental/core/services/network_services/back_end_end_point.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class AuthRepoImp extends AuthRepo {
  final ApiService apiService;

  AuthRepoImp({required this.apiService});
  @override
  Future<Either<Failure, TokenModel>> signIn({
    required String emailOrPhone,
    required String password,
  }) async {
    try {
      var response = await apiService.post(
        endPoint: BackEndEndPoint.signInEndPoint,
        data: {'email': emailOrPhone, 'password': password},
      );
      log(response.toString());
      return Right(TokenModel.fromJson(response['tokens']));
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
  Future<Either<Failure, TokenModel>> signUp({
    required UserModel userModel,
  }) async {
    try {
      var response = await apiService.post(
        endPoint: BackEndEndPoint.signUpEndPoint,
        data: {
          // 'phone': userModel.phone,
          'full_name': userModel.fullName,
          'email': userModel.email,
          'password': userModel.password,
          'country': userModel.countryModel?.toJson() ?? 'EG',
        },
      );
      return Right(TokenModel.fromJson(response['tokens']));
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
}
