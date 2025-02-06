import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class LoggingInterceptor extends Interceptor {
  final Logger _logger = Logger();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log(" ==> METHOD: ${response.requestOptions.method}\n ==>   PATH: ${response.requestOptions.uri}\n ==>   DATA: \n${jsonEncode(response.data)}");
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    _logger.e('Error: ${err.message}');
    return super.onError(err, handler);
  }
}
