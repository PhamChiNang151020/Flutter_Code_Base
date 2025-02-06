import 'package:code_base/data/models/post_model.dart';
import 'package:dio/dio.dart';

abstract class PostRepository {
  Future<List<Post>> getPosts();
}

class PostRepositoryImpl implements PostRepository {
  final Dio dio;

  PostRepositoryImpl({required this.dio});

  @override
  Future<List<Post>> getPosts() async {
    try {
      final response = await dio.get('/posts');
      return (response.data as List)
          .map((json) => Post.fromJson(json))
          .toList();
    } on DioException catch (e) {
      throw ServerException(message: e.message ?? 'Server error');
    }
  }
}

class ServerException implements Exception {
  final String message;
  final int? code;

  ServerException({required this.message, this.code});

  @override
  String toString() {
    if (code != null) {
      return 'ServerException (code: $code): $message';
    }
    return 'ServerException: $message';
  }
}
