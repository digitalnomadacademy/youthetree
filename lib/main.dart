import 'package:flutter/material.dart';

import 'package:youthetree/ui/page/code_onboarding_page.dart';


void main() {
  runApp(YTT());
}

class YTT extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: OnBoardingPage (),
    );
  }
}