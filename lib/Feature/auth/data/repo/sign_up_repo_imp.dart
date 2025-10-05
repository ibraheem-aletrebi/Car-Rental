import 'dart:developer';

import 'package:car_rental/Feature/auth/data/model/auth_response.dart';
import 'package:car_rental/Feature/auth/data/model/sign_up_request_model.dart';
import 'package:car_rental/Feature/auth/domain/repo/sign_up_repo.dart';
import 'package:car_rental/core/error/failure.dart';
import 'package:car_rental/core/services/network_services/api_service.dart';
import 'package:car_rental/core/services/network_services/back_end_end_point.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SignUpRepoImp extends SignUpRepo {
  final ApiService _apiService;
  SignUpRepoImp({required ApiService apiService}) : _apiService = apiService;

  @override
  Future<Either<Failure, AuthResponseModel>> signUp({
    required SignUpRequestModel signUpRequestModel,
  }) async {
    try {
      var response = await _apiService.post(
        endPoint: BackEndEndPoint.signUpEndPoint,
        data: signUpRequestModel.toJson(),
      );
      return Right(AuthResponseModel.fromJson(response));
    } catch (e) {
      log('error: ${e.toString()} From -> SignUP repo imp sign up');
      if ((e is DioException)) {
        return left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
