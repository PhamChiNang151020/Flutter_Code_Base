import 'package:code_base/utils/storage/my_hash.dart';
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
      _getLog(StorageType.SAVE, key, hashValue);
      await storage?.write(key: key, value: hashValue);
    }
  }

  Future<void> deleteStorage({required String key}) async {
    storage ??= const FlutterSecureStorage();
    if (key.isNotEmpty) {
      await storage?.delete(key: key);
      _getLog(StorageType.DELETE, key, "");
    }
  }

  Future<String> getDataStorage({required String key}) async {
    storage ??= const FlutterSecureStorage();
    if (key.isNotEmpty) {
      try {
        var hashValue = await storage?.read(key: key);
        var value = decryptStringWithAES(hashValue!);
        _getLog(StorageType.GET, key, value);
        return value;
      } catch (e) {
        return "";
      }
    }
    return "";
  }

  void _getLog(
    StorageType type,
    String? key,
    String? value,
  ) {
    // if (popstopApiUrl != AKS_PROD) {
    //   switch (type) {
    //     case StorageType.SAVE:
    //       logger.i("STORAGE SAVE [$key] - [ $value ]");
    //       break;
    //     case StorageType.GET:
    //       logger.i("STORAGE GET [$key] === [ $value ]");
    //       break;
    //     case StorageType.DELETE:
    //       logger.i("STORAGE DELETE [$key]");
    //       break;
    //     default:
    //       break;
    //   }
    // }
  }
}

enum StorageType { SAVE, GET, DELETE }
