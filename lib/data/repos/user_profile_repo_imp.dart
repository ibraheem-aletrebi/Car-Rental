import 'dart:developer';
import 'package:car_rental/core/error/failure.dart';
import 'package:car_rental/core/services/network_services/api_service.dart';
import 'package:car_rental/core/services/network_services/back_end_end_point.dart';
import 'package:car_rental/data/models/user_profile_model.dart';
import 'package:car_rental/domain/entities/user_entity.dart';
import 'package:car_rental/domain/repos/user_profile_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class UserProfileRepoImpl implements UserProfileRepo {
  final ApiService _apiService;
  UserProfileRepoImpl({required ApiService apiService})
    : _apiService = apiService;
  @override
  Future<Either<Failure, UserProfileEntity>> fetchUser() async {
    try {
      final response = await _apiService.get(
        endPoint: BackEndEndPoint.userProfileEndPoint,
      );
      UserProfileEntity user = (UserProfileModel.fromJson(
        response['data'],
      )).toEntity();

      return right(user);
    } catch (e) {
       log('error: ${e.toString()} From -> fetch user');
      if ((e is DioException)) {
        return left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));

    }
  }

  @override
  Future<Either<Failure, void>> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, UserProfileEntity>> updateUser(
    UserProfileEntity user,
  ) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }
}
