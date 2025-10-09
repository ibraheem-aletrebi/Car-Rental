import 'dart:developer';
import 'package:car_rental/Feature/car_details/domain/repo/car_details_repo.dart';
import 'package:car_rental/core/entities/car_entity.dart';
import 'package:car_rental/core/error/failure.dart';
import 'package:car_rental/core/models/car_model.dart';
import 'package:car_rental/core/services/network_services/api_service.dart';
import 'package:car_rental/core/services/network_services/back_end_end_point.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class CarDetailsRepoImp implements CarDetailsRepo {
  CarDetailsRepoImp({required ApiService apiService})
    : _apiService = apiService;

  final ApiService _apiService;

  @override
  Future<Either<Failure, CarEntity>> getCarDetails({required int id}) async {
    try {
      final response = await _apiService.get(
        endPoint: '${BackEndEndPoint.carDetailsEndPoint}$id',
      );
      final data = response;
      final CarEntity result = CarModel.fromJson(data).toEntity();
      return right(result);
    } catch (e) {
      log(
        'error: ${e.toString()} From -> car details repo imp fetch get car Details',
      );
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
