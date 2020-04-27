import 'package:flutter/material.dart';
import 'package:youthetree/ui/test/test_code_pop_up.dart';
import 'package:youthetree/ui/page/home_page.dart';
import 'package:youthetree/ui/page/initial_test.dart';
import 'package:youthetree/ui/page/splash_page.dart';
import 'package:youthetree/ui/test/test_tree_updates.dart';
import 'package:youthetree/ui/test/user_avatar_test.dart';
import 'package:youthetree/ui/test/dynamic_column.dart';

Map<String, WidgetBuilder> routes = {
  RouteName.home: (context) => HomePage(),
  RouteName.splash: (context) => SplashPage(),

  //  TEST ROUTES
  ...testRoutes
};

String initialRoute = RouteName.initialTest;

class RouteName {
  static const String home = '/';
  static const String splash = 'splash';

//  TEST ROUTES
  static const String initialTest = 'initialTest';
  static const String testPopup = 'testPopup';
  static const String testUserAvatar = 'testUserAvatar';
  static const String testDynamic = 'testDynamicColumn';
  static const String testTreeUpdates = 'testTreeUpdates';
}

Map<String, WidgetBuilder> testRoutes = {
  RouteName.initialTest: (context) => InitialTestPage(),
  RouteName.testPopup: (context) => TestPopUp(),
  RouteName.testUserAvatar: (context) => UserAvatarTest(),
  RouteName.testDynamic: (context) => DynamicColumn(),
  RouteName.testTreeUpdates: (context) => TestTreeUpdates(),
};
