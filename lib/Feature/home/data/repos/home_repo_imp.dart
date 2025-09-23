import 'dart:developer';
import 'package:car_rental/Feature/home/domain/repos/home_repo.dart';
import 'package:car_rental/core/Error/failure.dart';
import 'package:car_rental/core/models/brand_model.dart';
import 'package:car_rental/core/services/network_services/api_service.dart';
import 'package:car_rental/core/services/network_services/back_end_end_point.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImp extends HomeRepo {
  final ApiService _apiService;
  HomeRepoImp({required ApiService apiService}) : _apiService = apiService;
  @override
  Future<Either<Failure, List<BrandModel>>> fetchBrands() async {
    try {
      var response = await _apiService.get(
        endPoint: BackEndEndPoint.carBrandsEndPoint,
      );
      final data = response['data'] as List<dynamic>;
      final List<BrandModel> result = data
          .map((e) => BrandModel.fromJson(e as Map<String, dynamic>))
          .toList();
      return right(result);
    } catch (e) {
      log('error: ${e.toString()} From -> home repo imp fetch brands');
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
