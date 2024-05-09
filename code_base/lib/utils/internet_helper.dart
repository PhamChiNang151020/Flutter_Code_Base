import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';

class InternetHelper {
  Future<bool> isConnectInternet() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    log("$connectivityResult", name: "INTERNET");

    if (connectivityResult != ConnectivityResult.none) {
      return true;
    }

    return false;
  }
}
