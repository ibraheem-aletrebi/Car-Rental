import 'package:car_rental/domain/entities/car_entity.dart';
import 'package:car_rental/domain/entities/review_entity.dart';
import 'package:car_rental/core/error/failure.dart';
import 'package:dartz/dartz.dart';

abstract class CarDetailsRepo {
  Future<Either<Failure, CarEntity>> getCarDetails({required int id});
    Future<Either<Failure,List<ReviewEntity>>> getCarReviews({required int carId});
}
