import 'package:flutter/material.dart';
import 'package:youthetree/ui/page/map_test.dart';
//import 'package:youthetree/ui/page/SplashPage.dart';
//import 'package:youthetree/ui/page/home_page.dart';

Map<String, WidgetBuilder> routes = {
//  RouteName.home: (context) => HomePage(),
//  RouteName.splash: (context) => SplashPage(),

// TEST ROUTE
  RouteName.testMap: (context) => MapTest(),
};

String initialRoute = RouteName.testMap;

class RouteName {
  static const String home = '/';
  static const String splash = 'splash';

// TEST ROUTE
  static const String testMap = 'testMap';
}