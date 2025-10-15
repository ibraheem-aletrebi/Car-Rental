import 'dart:developer';
import 'package:car_rental/Feature/home/data/models/paginated_cars_model.dart';
import 'package:car_rental/Feature/home/domain/repos/home_repo.dart';
import 'package:car_rental/core/error/failure.dart';
import 'package:car_rental/data/models/brand_model.dart';
import 'package:car_rental/data/models/car_model.dart';
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

  @override
  Future<Either<Failure, PaginatedCarsModel>> fetchBestCars({
    int page = 1,
  }) async {
    try {
      var response = await _apiService.get(
        endPoint: BackEndEndPoint.bestCarsEndPoint,
        queryParameters: {'page': page},
      );
      final data = response['data'] as List<dynamic>;
      final List<CarModel> result = data
          .map((e) => CarModel.fromJson(e as Map<String, dynamic>))
          .toList();
      final meta = response['meta'];
      final currentPage = meta['current_page'] as int;
      final lastPage = meta['last_page'] as int;
      final hasMore = currentPage < lastPage;
      PaginatedCarsModel paginatedCarsModel = PaginatedCarsModel(
        cars: result,
        hasMore: hasMore,
      );
      return right(paginatedCarsModel);
    } catch (e) {
      log('error: ${e.toString()} From -> home repo imp fetch best cars');
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, PaginatedCarsModel>> fetchNearbyCars({int page = 1}) async {
    try {
      var response = await _apiService.get(
        endPoint: BackEndEndPoint.nearbyCarsEndPoint,
        queryParameters: {'page': page},
      );
      final data = response['data'] as List<dynamic>;
      final List<CarModel> result = data
          .map((e) => CarModel.fromJson(e as Map<String, dynamic>))
          .toList();
      final meta = response['meta'];
      final currentPage = meta['current_page'] as int;
      final lastPage = meta['last_page'] as int;
      final hasMore = currentPage < lastPage;
      PaginatedCarsModel paginatedCarsModel = PaginatedCarsModel(
        cars: result,
        hasMore: hasMore,
      );
      return right(paginatedCarsModel);
    } catch (e) {
      log('error: ${e.toString()} From -> home repo imp fetch nearby cars');
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
