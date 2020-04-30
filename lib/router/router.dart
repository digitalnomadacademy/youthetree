import 'package:flutter/material.dart';
import 'package:youthetree/ui/test/test_code_pop_up.dart';
import 'package:youthetree/ui/page/home_page.dart';
import 'package:youthetree/ui/page/onboarding_page.dart';
import 'package:youthetree/ui/page/initial_test.dart';
import 'package:youthetree/ui/page/splash_page.dart';
import 'package:youthetree/ui/test/user_avatar_test.dart';

Map<String, WidgetBuilder> routes = {
  RouteName.home: (context) => HomePage(),
  RouteName.splash: (context) => SplashPage(),
  RouteName.onBoarding: (context) => OnBoardingPage(),

  //  TEST ROUTES
  ...testRoutes,
};

String initialRoute = RouteName.initialTest;

class RouteName {
  static const String home = '/';
  static const String splash = 'splash';
  static const String onBoarding = 'onBoarding';

//  TEST ROUTES
  static const String initialTest = 'initialTest';
  static const String testPopup = 'testPopup';
  static const String testUserAvatar = 'testUserAvatar';
}

Map<String, WidgetBuilder> testRoutes = {
  RouteName.initialTest: (context) => InitialTestPage(),
  RouteName.testPopup: (context) => TestPopUp(),
  RouteName.testUserAvatar: (context) => UserAvatarTest()
};
