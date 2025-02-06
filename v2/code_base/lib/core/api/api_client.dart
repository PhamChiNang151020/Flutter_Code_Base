import 'package:code_base/core/api/interceptors.dart';
import 'package:dio/dio.dart';

class ApiClient {
  static final Dio _dio = Dio()
    ..options = BaseOptions(
      baseUrl: 'https://jsonplaceholder.typicode.com/',
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    )
    ..interceptors.addAll([
      LoggingInterceptor(),
    ]);

  static Dio get instance => _dio;
}
