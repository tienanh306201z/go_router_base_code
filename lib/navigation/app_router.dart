import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_base_code/screens/error_screen/error_screen.dart';
import 'package:go_router_base_code/screens/home_screen/home_screen.dart';
import 'package:go_router_base_code/screens/login_screen/login_screen.dart';
import 'package:go_router_base_code/screens/setting_screen/setting_screen.dart';
import 'package:go_router_base_code/screens/splash_screen/splash_screen.dart';

import 'app_route.dart';

class AppRouter {
  static final _navigationKey = GlobalKey<NavigatorState>();

  static GoRouter get router => _router;

  static String getCurrentPath(BuildContext context) =>
      GoRouterState.of(context).uri.toString();

  static GoRouterState getCurrentState(BuildContext context) =>
      GoRouterState.of(context);

  static final GoRouter _router = GoRouter(
    navigatorKey: _navigationKey,
    debugLogDiagnostics: true,
    errorBuilder: (context, state) => ErrorScreen(errorPath: state.name ?? ""),
    initialLocation: "/splash",
    routes: [
      GoRoute(
        path: "/home",
        name: AppRoute.home.name,
        pageBuilder: (context, state) => _buildPageAnimation(
            child: const HomeScreen(), pageKey: state.pageKey),
        routes: [
          GoRoute(
            name: AppRoute.setting.name,
            path: "settings/:name",
            pageBuilder: (context, state) => _buildPageAnimation(
                child: SettingScreen(
                  name: state.pathParameters["name"] as String,
                ),
                pageKey: state.pageKey),
          )
        ],
      ),
      GoRoute(
        path: "/splash",
        name: AppRoute.splash.name,
        pageBuilder: (context, state) => _buildPageAnimation(
            child: const SplashScreen(), pageKey: state.pageKey),
      ),
      GoRoute(
        path: "/login",
        name: AppRoute.login.name,
        pageBuilder: (context, state) => _buildPageAnimation(
            child: const LoginScreen(), pageKey: state.pageKey),
      ),
    ],
  );

  static CustomTransitionPage _buildPageAnimation(
      {required Widget child, LocalKey? pageKey}) {
    return CustomTransitionPage(
      key: pageKey,
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var tween = Tween(begin: const Offset(1.0, 0.0), end: Offset.zero);
        var curvedAnimation = CurvedAnimation(
          parent: animation,
          curve: Curves.ease,
        );
        return SlideTransition(
          position: tween.animate(curvedAnimation),
          child: child,
        );
      },
    );
  }

  static void pop() {
    if (canPop()) {
      _router.pop();
    }
  }

  static bool canPop() {
    return _router.canPop();
  }

  static void go(
    String route, {
    Object? extra,
  }) {
    _router.go(route, extra: extra);
  }

  static void goNamed(
    AppRoute routeName, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, dynamic> queryParameters = const <String, dynamic>{},
    Object? extra,
  }) {
    _router.goNamed(routeName.name,
        pathParameters: pathParameters,
        queryParameters: queryParameters,
        extra: extra);
  }

  static Future<T?> replacementNamed<T extends Object?>(
    AppRoute routeName, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, dynamic> queryParameters = const <String, dynamic>{},
    Object? extra,
  }) {
    return _router.replaceNamed(routeName.name,
        pathParameters: pathParameters, queryParameters: queryParameters);
  }

  static void popAndGoNamed(
    AppRoute routeName, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, dynamic> queryParameters = const <String, dynamic>{},
    Object? extra,
  }) {
    pop();
    goNamed(routeName,
        pathParameters: pathParameters,
        queryParameters: queryParameters,
        extra: extra);
  }

  static String namedLocation(
    AppRoute routeName, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, dynamic> queryParameters = const <String, dynamic>{},
  }) {
    return _router.namedLocation(routeName.name,
        pathParameters: pathParameters, queryParameters: queryParameters);
  }
}
