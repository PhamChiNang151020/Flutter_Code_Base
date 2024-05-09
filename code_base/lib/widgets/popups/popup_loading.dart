import 'package:flutter/material.dart';

import '../../common/my_colors.dart';

class PopupLoading {
  static final PopupLoading _singleton = PopupLoading._internal();
  bool isShow = false;
  final OverlayEntry _overlayEntry = OverlayEntry(builder: (context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    return Container(
      width: width,
      height: height,
      color: MyColors.defaultColor,
      // child: WidgetLoading(),
    );
  });

  factory PopupLoading() {
    return _singleton;
  }

  PopupLoading._internal();

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
