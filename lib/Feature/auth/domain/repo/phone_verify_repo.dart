
import 'package:car_rental/Feature/auth/data/model/verify_phone_response_model.dart';
import 'package:car_rental/core/error/failure.dart';
import 'package:dartz/dartz.dart';

abstract class PhoneVerifyRepo {
  Future<Either<Failure, VerifyPhoneResponseModel>> sendOtp(String phoneNumber);
  Future<Either<Failure, VerifyPhoneResponseModel>> resendOtp(String phoneNumber);
  Future<Either<Failure, dynamic>> verifyOtp(String phoneNumber, String otp);
}