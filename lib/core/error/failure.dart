import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;
  const Failure(this.errorMessage);
}

class ServerFailure extends Failure {
  const ServerFailure(super.errorMessage);

  factory ServerFailure.fromDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return const ServerFailure('Connection Timeout');
      case DioExceptionType.receiveTimeout:
        return const ServerFailure('Receive Timeout');
      case DioExceptionType.badCertificate:
        return const ServerFailure('Bad Certificate');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          e.response!.statusCode!,
          e.response!.data,
        );
      case DioExceptionType.cancel:
        return const ServerFailure('Request Cancelled');
      case DioExceptionType.connectionError:
        return const ServerFailure('No Internet Connection');
      case DioExceptionType.unknown:
        return const ServerFailure('Unknown Error');
      default:
        return const ServerFailure('Opps There was an Error, Please try again');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 404) {
      return ServerFailure('Your request was not found, please try later');
    } else if (statusCode == 500) {
      return ServerFailure('There is a problem with server, please try later');
    } else if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      // return ServerFailure(response['error']['message']);
      return ServerFailure('There was an error , please try again');
    } else {
      return ServerFailure('There was an error , please try again');
    }
  }
}
