import 'package:flutter/material.dart';
import 'package:youthetree/ui/test/test_code_pop_up.dart';
import 'package:youthetree/ui/page/home_page.dart';
import 'package:youthetree/ui/page/initial_test.dart';
import 'package:youthetree/ui/page/splash_page.dart';
import 'package:youthetree/ui/test/user_avatar_test.dart';
import 'package:youthetree/ui/test/dynamic_column.dart';
import 'package:youthetree/ui/test/test_share_popup.dart';



Map<String, WidgetBuilder> routes = {
  RouteName.home: (context) => HomePage(),
  RouteName.splash: (context) => SplashPage(),

  //  TEST ROUTES
  ...testRoutes
};

String initialRoute = RouteName.testSharePopup;

class RouteName {
  static const String home = '/';
  static const String splash = 'splash';

//  TEST ROUTES
  static const String initialTest = 'initialTest';
  static const String testPopup = 'testPopup';
  static const String testUserAvatar = 'testUserAvatar';
  static const String testDynamic = 'testDynamicColumn';
  static const String testSharePopup = 'testSharePopup';

}

Map<String, WidgetBuilder> testRoutes = {
  RouteName.initialTest: (context) => InitialTestPage(),
  RouteName.testPopup: (context) => TestPopUp(),
  RouteName.testUserAvatar: (context) => UserAvatarTest(),
  RouteName.testDynamic: (context)  =>DynamicColumn(),
  RouteName.testSharePopup: (context) => SharePopup(),
};
