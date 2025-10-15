import 'package:car_rental/Feature/home/data/models/paginated_cars_model.dart';
import 'package:car_rental/core/error/failure.dart';
import 'package:car_rental/data/models/brand_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BrandModel>>> fetchBrands();
  Future<Either<Failure, PaginatedCarsModel>> fetchBestCars({int page = 1});
  Future<Either<Failure, PaginatedCarsModel>> fetchNearbyCars({int page = 1});
}
