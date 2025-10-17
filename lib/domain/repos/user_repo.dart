import 'package:car_rental/core/error/failure.dart';
import 'package:car_rental/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';

abstract class UserRepo {
  Future<Either<Failure, UserProfileEntity>> fetchUser();
  Future<Either<Failure, UserProfileEntity>> updateUser(UserProfileEntity user);
  Future<Either<Failure, void>> logout();
}
