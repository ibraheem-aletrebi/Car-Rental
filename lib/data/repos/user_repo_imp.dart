import 'dart:developer';
import 'package:car_rental/core/enums/avialable_add_car.dart';
import 'package:car_rental/core/error/failure.dart';
import 'package:car_rental/core/services/network_services/api_service.dart';
import 'package:car_rental/core/services/network_services/back_end_end_point.dart';
import 'package:car_rental/data/models/user_profile_model.dart';
import 'package:car_rental/domain/entities/user_entity.dart';
import 'package:car_rental/domain/repos/user_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class UserRepoImpl implements UserRepo {
  final ApiService _apiService;
  UserRepoImpl({required ApiService apiService}) : _apiService = apiService;
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
  ) async {
    try {
      final formData = FormData.fromMap({
        'full_name': user.fullName,
        'email': user.email,
        'phone': user.phone,
        'country_id': user.country.id,
        'location_id': user.location.id,
        'available_to_create_car':
            user.availableToCreateCar == AvailableToAddCar.yes ? 1 : 0,
      });

      final response = await _apiService.put(
        endPoint: BackEndEndPoint.userProfileEditEndPoint,
        data: formData,
        options: Options(contentType: 'multipart/form-data'),
      );

      final updatedUser = UserProfileModel.fromJson(
        response['data'],
      ).toEntity();
      return right(updatedUser);
    } catch (e) {
      log('error: ${e.toString()} From -> update user');
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
