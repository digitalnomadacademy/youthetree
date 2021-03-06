import 'package:flutter/material.dart';
import 'package:youthetree/ui/page/create_account.dart';
import 'package:youthetree/ui/page/home_page.dart';
import 'package:youthetree/ui/page/initial_test.dart';
import 'package:youthetree/ui/page/login_page.dart';
import 'package:youthetree/ui/page/map_test.dart';
import 'package:youthetree/ui/page/new_message.dart';
import 'package:youthetree/ui/page/onboarding_page.dart';
import 'package:youthetree/ui/page/splash_page.dart';
import 'package:youthetree/ui/test/test_code_pop_up.dart';
import 'package:youthetree/ui/test/user_avatar_test.dart';

Map<String, WidgetBuilder> routes = {
  RouteName.home: (context) => HomePage(),
  RouteName.splash: (context) => SplashPage(),
  RouteName.newMessage: (context) => NewMessagePage(),
  RouteName.createAccount: (context) => CreateAccountPage(),
  RouteName.login: (context) => LoginPage(),
  RouteName.onBoarding: (context) => OnBoardingPage(),

//  TEST ROUTES
  ...testRoutes
};

String initialRoute = RouteName.initialTest;

class RouteName {
  static const String home = '/';
  static const String splash = 'splash';
  static const String createAccount = 'createAccount';
  static const String login = 'login';
  static const String newMessage = '/newMessage';
  static const String onBoarding = 'onBoarding';

//  TEST ROUTES
//  only if you need to test a widget
  static const String initialTest = 'initialTest';
  static const String testPopup = 'testPopup';
  static const String testUserAvatar = 'testUserAvatar';

  static const String testMap = 'testMap';
  static const String testDynamic = 'testDynamicColumn';
  static const String testTreeUpdates = 'testTreeUpdates';
}

Map<String, WidgetBuilder> testRoutes = {
  RouteName.initialTest: (context) => InitialTestPage(),
  RouteName.testPopup: (context) => TestPopUp(),
  RouteName.testUserAvatar: (context) => UserAvatarTest(),
  RouteName.testMap: (context) => MapTest(),
};
