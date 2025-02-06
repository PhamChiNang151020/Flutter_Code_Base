import 'package:code_base/features/home/home_page.dart';
import 'package:code_base/features/splash/splash_page.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: SPLASH_PAGE,
  routes: <RouteBase>[
    GoRoute(
      path: SPLASH_PAGE,
      pageBuilder: (context, state) => MaterialPage(
        key: state.pageKey,
        child: const SplashPage(),
      ),
    ),
    GoRoute(
      path: HOME_PAGE,
      pageBuilder: (context, state) => MaterialPage(
        key: state.pageKey,
        child: const HomePage(),
      ),
    ),
  ],
  // errorBuilder: (context, state) => const ErrorPage(),
);

// * Routes
const String SPLASH_PAGE = "/splash";
const String SIGN_IN_PAGE = "/sign-in";
const String SIGN_UP_PAGE = "/sign-up";
const String HOME_PAGE = "/home";
