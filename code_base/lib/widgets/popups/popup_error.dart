import 'package:code_base/common/my_colors.dart';
import 'package:flutter/material.dart';

class PopupError {
  factory PopupError() {
    return _singleton;
  }

  PopupError._internal();

  static final PopupError _singleton = PopupError._internal();
  bool isShow = false;
  String title = "";
  String content = "";
  String textButton = "";
  Function()? onButtonClick;
  final OverlayEntry _overlayEntry = OverlayEntry(builder: (context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    return Container(
      width: width,
      height: height,
      color: MyColors.defaultColor,
    );
  });

  show(BuildContext context,
      {required String title,
      required String content,
      String textButton = "",
      Function()? onButtonClick}) {
    if (isShow) return;

    this.title = title;
    this.content = content;
    this.textButton = textButton;
    this.onButtonClick = onButtonClick;
    Overlay.of(context).insert(_overlayEntry);
    isShow = true;
  }

  hide() {
    if (!isShow) return;

    _overlayEntry.remove();
    isShow = false;
  }
}
