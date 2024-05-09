// ignore_for_file: unused_field

import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'dart:developer';
import 'package:flutter/material.dart';

typedef OnReceiverMessage = Function();

class FirebaseNotifications {
  FirebaseMessaging? _firebaseMessaging;
  OnReceiverMessage? _onReceiverMessage;
  OnReceiverMessage? _onOpenedAppInBackground;
  BuildContext? context;

  static final FirebaseNotifications _singleton =
      FirebaseNotifications._internal();

  factory FirebaseNotifications() {
    return _singleton;
  }

  FirebaseNotifications._internal();

  Future<void> initialFirebaseNotifications() async {
    _firebaseMessaging = FirebaseMessaging.instance;
    log("INIT", name: "FIREBASE");
    await FirebaseMessaging.instance.setAutoInitEnabled(true);
    firebaseCloudMessagingListeners();
  }

  Future<void> firebaseCloudMessagingListeners() async {
    if (Platform.isIOS) await iOSPermission();

    _firebaseMessaging?.getToken().then((token) {
      log("TOKEN NOTIFICATION === $token", name: "FIREBASE");
      // copyToClipBoard(text: token);
    });
    await FirebaseMessaging.instance.getInitialMessage().then(
      (RemoteMessage? message) async {
        //click notification open app from foreground
        if (message != null) {}
      },
    );
    FirebaseMessaging.onMessage.listen((RemoteMessage event) {
      log('onMessage received ${event.data}', name: "FIREBASE");

      // _onReceiverMessage!(event.data);
    });
    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      log('onMessageOpenedApp received', name: "FIREBASE");
      //click notification open app from background
    });
  }

  void setListenerReceiveFirebase(
      {required OnReceiverMessage onReceiverMessage,
      required BuildContext context,
      required OnReceiverMessage onOpenedAppInBackground}) {
    this.context = context;
    _onReceiverMessage = onReceiverMessage;
    _onOpenedAppInBackground = onOpenedAppInBackground;
  }

  Future<void> iOSPermission() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    await FirebaseMessaging.instance.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    // _firebaseMessaging.requestNotificationPermissions(
    //     IosNotificationSettings(sound: true, badge: true, alert: true));
    // _firebaseMessaging.onIosSettingsRegistered
    //     .listen((IosNotificationSettings settings) {
    //   print("Settings registered: $settings");
    // });
  }
}
