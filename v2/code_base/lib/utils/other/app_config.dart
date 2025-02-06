import 'dart:developer';

import 'package:flutter/services.dart';

class AppConfig {
  static late final String environment;
  static const platform = MethodChannel('method_channel_example');
  static const METHOD_CONFIG = "getConfigPOPStop";

  static String get ENV => environment;

  static String DEV = "";
  static String UAT = "";
  static String PROD = "";

  static Future<void> initialize() async {
    try {
      final config = await platform.invokeMapMethod(METHOD_CONFIG);
      environment = config?['ENVIRONMENT'] ?? 'UNKNOWN';
    } catch (e) {
      log(e.toString());
      environment = "UNKNOWN";
    }
  }

  static String VERSION = "1.0.0";
  static String getHostUrl() {
    switch (ENV) {
      case "DEV":
        return DEV;
      case "UAT":
        return UAT;
      case "PROD":
        return PROD;
      default:
        return DEV;
    }
  }

  static String getHostName() {
    switch (ENV) {
      case "DEV":
        return "DEV -";
      case "UAT":
        return "UAT -";
      case "PROD":
      default:
        return "";
    }
  }
}
