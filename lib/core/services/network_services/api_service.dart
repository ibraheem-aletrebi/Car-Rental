import 'dart:developer';

import 'package:car_rental/Feature/auth/domain/repo/auth_repo.dart';
import 'package:car_rental/core/services/local_services/secure_storage_services.dart';
import 'package:car_rental/core/services/service_locator.dart';
import 'package:dio/dio.dart';

class ApiService {
  ApiService({required this.dio}) {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          log('REQUEST[${options.method}] => PATH: ${options.path}');

          final accessToken = await SecureStorageService().getAccessToken();
          if (accessToken != null) {
            options.headers['Authorization'] = 'Bearer $accessToken';
          }
          return handler.next(options);
        },
        onResponse: (response, handler) {
          // لما ييجي Response
          log('RESPONSE[${response.statusCode}] => DATA: ${response.data}');
          return handler.next(response);
        },
        onError: (DioException e, handler) async {
          log('ERROR[${e.response?.statusCode}] => DATA: ${e.response?.data}');
          if (e.response?.statusCode == 401) {
            try {
              final refreshToken = await getIt<SecureStorageService>()
                  .getRefreshToken();
              await getIt<AuthRepo>().refreshToken(refreshToken: refreshToken!);
              final newAccessToken = await getIt<SecureStorageService>()
                  .getAccessToken();
              e.requestOptions.headers['Authorization'] =
                  'Bearer $newAccessToken';
              final clonedRequest = await dio.fetch(e.requestOptions);
              return handler.resolve(clonedRequest);
            } catch (error) {
              log('error: ${e.toString()} From -> ApiService -> onError');
              return handler.reject(e);
            }
          }
          return handler.next(e);
        },
      ),
    );
  }

  final Dio dio;
  final String baseUrl = 'https://qent.up.railway.app/api/';

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await dio.get('$baseUrl$endPoint');
    return response.data;
  }

  Future<Map<String, dynamic>> post({
    required String endPoint,
    required Map<String, dynamic> data,
    Options? options,
  }) async {
    var response = await dio.post(
      '$baseUrl$endPoint',
      data: data,
      options: options,
    );
    return response.data;
  }

  Future<Map<String, dynamic>> put({
    required String endPoint,
    required Map<String, dynamic> data,
  }) async {
    var response = await dio.put('$baseUrl$endPoint', data: data);
    return response.data;
  }

  Future<Map<String, dynamic>> delete({required String endPoint}) async {
    var response = await dio.delete('$baseUrl$endPoint');
    return response.data;
  }

  Future<Map<String, dynamic>> patch({required String endPoint}) async {
    var response = await dio.patch('$baseUrl$endPoint');
    return response.data;
  }
}
