import 'package:flutter/material.dart';
import 'package:youthetree/ui/page/home_page.dart';
import 'package:youthetree/ui/page/splash_page.dart';

Map<String, WidgetBuilder> routes = {
  RouteName.home: (context) => HomePage(),
  RouteName.splash: (context) => SplashPage(),
};

String initialRoute = RouteName.splash;

class RouteName {
  static const String home = '/';
  static const String splash = 'splash';
}
