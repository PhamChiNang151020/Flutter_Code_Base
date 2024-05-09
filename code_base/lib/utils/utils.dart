import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Utils {
  static final Utils _singleton = Utils._internal();

  factory Utils() {
    return _singleton;
  }

  Utils._internal();

  changeScreenStateFulWidget(
      BuildContext context, StatefulWidget statefulWidget) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => statefulWidget),
    );
  }

  changeScreenStatelessWidget(
      BuildContext context, StatelessWidget statelessWidget) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => statelessWidget),
    );
  }

  changeScreenWithNamed(BuildContext context, String named) {
    Navigator.pushNamed(context, named);
  }

  changeScreenAndRemoveWithNamed(BuildContext context, String named) {
    Navigator.of(context)
        .pushNamedAndRemoveUntil(named, (Route<dynamic> route) => false);
  }

  changeScreenAndReplaceWithNamed(BuildContext context, String named,
      {dynamic data}) {
    Navigator.restorablePushReplacementNamed(context, named, arguments: data);
  }

  popBack(BuildContext context) {
    Navigator.of(context).pop();
  }

  popUntilWithCountCheck(BuildContext context, int countCheck) {
    var count = 0;
    Navigator.popUntil(context, (route) {
      return count++ == countCheck;
    });
  }

  changeScreenAndRemoveWithNamedData(
      BuildContext context, String named, dynamic object) {
    Navigator.of(context).pushNamedAndRemoveUntil(
        named, (Route<dynamic> route) => false,
        arguments: object);
  }

  changeScreenNamedWithData(
      BuildContext context, String named, dynamic object) {
    Navigator.pushNamed(context, named, arguments: object);
  }

  changeScreenNamedWithDataAndWait(
      BuildContext context, String named, dynamic object) async {
    return await Navigator.pushNamed(context, named, arguments: object);
  }

  clearFocus(BuildContext context) {
    FocusScope.of(context).unfocus();
  }
}

void printDebug(String string) {
  if (kDebugMode) {
    // print(string);
    log(string);
  }
}
