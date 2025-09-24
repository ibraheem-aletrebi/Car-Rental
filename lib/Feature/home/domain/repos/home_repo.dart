import 'package:car_rental/core/Error/failure.dart';
import 'package:car_rental/core/models/brand_model.dart';
import 'package:car_rental/core/models/car_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {

  Future<Either<Failure,List<BrandModel>>> fetchBrands();
  Future<Either<Failure,List<CarModel>>> fetchBestCars();
  Future<Either<Failure,List<CarModel>>> fetchNearbyCars();
}