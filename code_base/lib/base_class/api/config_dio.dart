import 'package:code_base/api/app_config_url.dart';
import 'package:dio/dio.dart';

import 'dart:io';
import 'package:dio/io.dart';

Future<void> configDio(Dio dio) async {
  if (Platform.isAndroid) {
    dio.httpClientAdapter = IOHttpClientAdapter(
      createHttpClient: () {
        // Don't trust any certificate just because their root cert is trusted.
        final HttpClient client =
            HttpClient(context: SecurityContext(withTrustedRoots: false));
        // You can test the intermediate / root cert here. We just ignore it.
        client.badCertificateCallback = (cert, host, port) => true;
        return client;
      },
    );
  }

  dio.options.baseUrl = AppConfigUrl.BASE_URL;
  dio.interceptors.add(LogInterceptor(
    requestHeader: true,
    requestBody: true,
    responseBody: true,
  ));
  dio.options.connectTimeout = const Duration(seconds: 60);

  // * Add token if authentication by header is enabled
  // var token = await AppSharedPreferences().getSharedPreferences(TOKEN);
  // dio.options.headers["x-access-token"] = token;
  // dio.options.headers["Authorization"] = getBasicAuth();
}
