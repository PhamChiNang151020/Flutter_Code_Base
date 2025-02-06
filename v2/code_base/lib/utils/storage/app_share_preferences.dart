import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPreferences {
  SharedPreferences? _prefs;
  final Logger _logger = Logger();

  static final AppSharedPreferences _singleton =
      AppSharedPreferences._internal();

  factory AppSharedPreferences() {
    return _singleton;
  }

  AppSharedPreferences._internal();

  Future<bool> setSharedPreferences(String key, dynamic value) async {
    _logger.d("setSharedPreferences === [$key] - [ $value ] ");
    _prefs ??= await SharedPreferences.getInstance();
    bool result = false;
    switch (value.runtimeType) {
      case const (int):
        result = await _prefs!.setInt(key, value);
        break;
      case const (String):
        result = await _prefs!.setString(key, value);
        break;
      case const (bool):
        result = await _prefs!.setBool(key, value);
        break;
      case const (double):
        result = await _prefs!.setDouble(key, value);
        break;
      default:
        break;
    }

    return result;
  }

  Future<dynamic> getSharedPreferences(
    String key, {
    dynamic defaultValue,
  }) async {
    _prefs ??= await SharedPreferences.getInstance();

    var value = _prefs!.get(key);
    _logger
        .d("getSharedPreferences [$key] == [ $value ], default: $defaultValue");

    return value ?? defaultValue;
  }
}
