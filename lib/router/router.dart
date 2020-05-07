import 'package:flutter/material.dart';
import 'package:youthetree/ui/page/new_message.dart';
import 'package:youthetree/ui/test/test_code_pop_up.dart';
import 'package:youthetree/ui/page/home_page.dart';
import 'package:youthetree/ui/page/initial_test.dart';
import 'package:youthetree/ui/page/splash_page.dart';
import 'package:youthetree/ui/test/test_login_page.dart';
import 'package:youthetree/ui/test/test_tree_updates.dart';
import 'package:youthetree/ui/test/user_avatar_test.dart';
import 'package:youthetree/ui/test/dynamic_column.dart';

Map<String, WidgetBuilder> routes = {
  RouteName.home: (context) => HomePage(),
  RouteName.splash: (context) => SplashPage(),
  RouteName.newMessage: (context) => NewMessagePage(),

  //  TEST ROUTES
  ...testRoutes
};

String initialRoute = RouteName.initialTest;

class RouteName {
  static const String home = '/';
  static const String splash = 'splash';
  static const String newMessage = '/newMessage';

//  TEST ROUTES
  static const String initialTest = 'initialTest';
  static const String testPopup = 'testPopup';
  static const String testUserAvatar = 'testUserAvatar';
  static const String testDynamic = 'testDynamicColumn';
  static const String testTreeUpdates = 'testTreeUpdates';
  static const String testLoginPage = 'testLoginPage';


}

Map<String, WidgetBuilder> testRoutes = {
  RouteName.initialTest: (context) => InitialTestPage(),
  RouteName.testPopup: (context) => TestPopUp(),
  RouteName.testUserAvatar: (context) => UserAvatarTest(),
  RouteName.testDynamic: (context) => DynamicColumn(),
  RouteName.testTreeUpdates: (context) => TestTreeUpdates(),
  RouteName.testLoginPage: (context) => TestLoginPage(),
};
