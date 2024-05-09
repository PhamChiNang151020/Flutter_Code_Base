// ignore_for_file: constant_identifier_names

import 'firebase_notifications.dart';

enum FirebaseManagerType { ANALYTICS, CRASHLYTICS, NOTIFICATION }

class FirebaseManager {
  static final FirebaseManager _singleton = FirebaseManager._internal();

  factory FirebaseManager() {
    return _singleton;
  }

  FirebaseManager._internal();

  Future<void> initial(
      List<FirebaseManagerType> firebaseManagerTypeList) async {
    if (firebaseManagerTypeList.contains(FirebaseManagerType.ANALYTICS)) {
      // analytics = FirebaseAnalytics();
    }
    if (firebaseManagerTypeList.contains(FirebaseManagerType.CRASHLYTICS)) {
//      Crashlytics.instance.enableInDevMode = true;

      // Pass all uncaught errors from the framework to Crashlytics.
//      FlutterError.onError = Crashlytics.instance.recordFlutterError;
    }
    if (firebaseManagerTypeList.contains(FirebaseManagerType.NOTIFICATION)) {
      await FirebaseNotifications().initialFirebaseNotifications();
    }
  }
}
