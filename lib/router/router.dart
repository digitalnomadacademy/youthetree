import 'package:flutter/material.dart';
import 'package:youthetree/ui/page/home_page.dart';
import 'package:youthetree/ui/page/onboarding_page.dart';
import 'package:youthetree/ui/page/splash_page.dart';
import 'package:youthetree/ui/page/test_code_popup_page.dart';

Map<String, WidgetBuilder> routes = {
  RouteName.home: (context) => HomePage(),
  RouteName.splash: (context) => SplashPage(),
  RouteName.onBoarding: (context) => OnBoardingPage(),

  //  TEST ROUTES
  RouteName.testPopup: (context) => TestCodePopupPage(),
};

String initialRoute = RouteName.splash;

class RouteName {
  static const String home = '/';
  static const String splash = 'splash';
  static const String onBoarding = 'onBoarding';

//  TEST ROUTES
  static const String testPopup = 'testPopup';
}
