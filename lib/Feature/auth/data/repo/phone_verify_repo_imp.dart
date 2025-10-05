import 'dart:developer';

import 'package:car_rental/Feature/auth/data/model/verify_phone_response_model.dart';
import 'package:car_rental/Feature/auth/domain/repo/phone_verify_repo.dart';
import 'package:car_rental/core/error/failure.dart';
import 'package:car_rental/core/services/local_services/secure_storage_services.dart';
import 'package:car_rental/core/services/network_services/api_service.dart';
import 'package:car_rental/core/services/network_services/back_end_end_point.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class PhoneVerifyRepoImpl implements PhoneVerifyRepo {
  final ApiService _apiService;
  final SecureStorageService _secureStorageService;
  PhoneVerifyRepoImpl({
    required ApiService apiService,
    required SecureStorageService secureStorageService,
  }) : _apiService = apiService,
       _secureStorageService = secureStorageService;

  @override
  Future<Either<Failure, VerifyPhoneResponseModel>> sendOtp(
    String phoneNumber,
  ) async {
    try {
      String? accessToken = await _secureStorageService.getAccessToken();

      var response = await _apiService.post(
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
  Future<Either<Failure, VerifyPhoneResponseModel>> resendOtp(
    String phoneNumber,
  ) async {
    try {
      String? accessToken = await _secureStorageService.getAccessToken();

      var response = await _apiService.post(
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
  Future<Either<Failure, dynamic>> verifyOtp(
    String verifyToken,
    String otp,
  ) async {
    try {
      var response = await _apiService.post(
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
}
