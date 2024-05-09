import 'dart:developer';

import 'package:code_base/base_class/storage/my_hash.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AppStorage {
  FlutterSecureStorage? storage;
  static final AppStorage _singleton = AppStorage._internal();

  factory AppStorage() {
    return _singleton;
  }

  AppStorage._internal();

  Future<void> saveStorage({required String key, required String value}) async {
    storage ??= const FlutterSecureStorage();
    if (key.isNotEmpty) {
      var hashValue = encryptStringWithAES(value);
      log("SAVE [$key] - [ $hashValue ]", name: "STORAGE");
      await storage?.write(key: key, value: hashValue);
    }
  }

  Future<void> deleteStorage({required String key}) async {
    storage ??= const FlutterSecureStorage();
    if (key.isNotEmpty) {
      log("DELETE [$key]", name: "STORAGE");

      await storage?.delete(key: key);
    }
  }

  Future<String> getDataStorage({required String key}) async {
    storage ??= const FlutterSecureStorage();
    if (key.isNotEmpty) {
      try {
        var hashValue = await storage?.read(key: key);
        var value = decryptStringWithAES(hashValue!);
        log("GET [$key] === [ $value ]", name: "STORAGE");
        return value;
      } catch (e) {
        return "";
      }
    }
    return "";
  }
}
