import 'dart:developer';

import 'package:dio/dio.dart';

class ApiService {
  ApiService({required this.dio}) {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // قبل ما يطلع الـ Request
          log('REQUEST[${options.method}] => PATH: ${options.path}');

          // مثال: تضيف Header ثابت
          // options.headers['Authorization'] = 'Bearer your_token_here';

          return handler.next(options); // لازم تكمّل
        },
        onResponse: (response, handler) {
          // لما ييجي Response
          log('RESPONSE[${response.statusCode}] => DATA: ${response.data}');
          return handler.next(response);
        },
        onError: (DioException e, handler) {
          // لو حصل Error
          log('ERROR[${e.response?.statusCode}] => DATA: ${e.response?.data}');
          return handler.next(e);
        },
      ),
    );
  }

  final Dio dio;
  final String baseUrl = 'https://qent.up.railway.app/api/auth/';

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await dio.get('$baseUrl$endPoint');
    return response.data;
  }

  Future<Map<String, dynamic>> post({
    required String endPoint,
    required Map<String, dynamic> data,
  }) async {
    var response = await dio.post('$baseUrl$endPoint', data: data);
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
