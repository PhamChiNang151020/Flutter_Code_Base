// * Run terminal => flutter pub run build_runner build --delete-conflicting-outputs
// * OR run          flutter pub run build_runner watch --delete-conflicting-outputs




import 'package:code_base/core/api/api_client.dart';
import 'package:code_base/data/repositories/post_repositories.dart';
import 'package:code_base/data/service_locator.config.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@InjectableInit()
void configureDependencies() => getIt.init();

@module
abstract class RegisterModule {
  @singleton
  Dio get dio => ApiClient.instance;

  @singleton
  PostRepository get postRepository => PostRepositoryImpl(dio: dio);
}