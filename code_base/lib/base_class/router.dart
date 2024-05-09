// import 'package:fertility/page/log_in/log_in_page.dart';
import 'package:code_base/screens/coming_soon/coming_soon_page.dart';
import 'package:code_base/screens/splash_screen/splash_screen_page.dart';
import 'package:code_base/utils/screen_key.dart';

import 'package:flutter/material.dart';

PageRouteBuilder routerWithData(RouteSettings settings) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) {
      switch (settings.name) {
        case SPLASH_SCREEN:
          return splashScreenPage(settings);

        default:
          return comingSoonPage(settings);
      }
    },
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        _slideTransition(animation, child),
  );
}

Map<String, WidgetBuilder> routerWithNamed() {
  return {
    "/": (context) => const SplashScreenPage(),
  };
}

Map getArguments(RouteSettings settings) {
  Map arguments = settings.arguments as Map;
  return arguments;
}

SlideTransition _slideTransition(Animation<double> animation, Widget child) {
  const begin = Offset(1, 0);
  const end = Offset.zero;
  const curve = Curves.ease;

  var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

  return SlideTransition(
    position: animation.drive(tween),
    child: child,
  );
}
