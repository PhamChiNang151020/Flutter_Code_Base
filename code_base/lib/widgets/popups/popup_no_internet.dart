import 'package:flutter/material.dart';

class PopupNoInternet {
  factory PopupNoInternet() {
    return _singleton;
  }

  PopupNoInternet._internal();

  static final PopupNoInternet _singleton = PopupNoInternet._internal();
  bool isShow = false;
  final OverlayEntry _overlayEntry = OverlayEntry(builder: (context) {
    return Container();
  });

  show(BuildContext context) {
    if (isShow) return;
    Overlay.of(context).insert(_overlayEntry);
    isShow = true;
  }

  hide() {
    if (!isShow) return;

    _overlayEntry.remove();
    isShow = false;
  }
}
