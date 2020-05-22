import 'dart:async';
import 'package:flutter/material.dart';
import 'package:youthetree/emaos/action/splash_action.dart';
import 'package:youthetree/logger/logger.dart';
import 'package:youthetree/router/router.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  double opacity = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(251, 222, 214, 1),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Center(
              child: Text(
                "YTT",
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
          ),
          AnimatedOpacity(
              duration: Duration(milliseconds: 500),
              opacity: opacity,
              child: Image.asset("assets/tree.jpg")),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _waitForAppInit();
    _startAnimation();
  }

  Future _waitForAppInit() =>
      Future.delayed(Duration(milliseconds: 1500), _checkForAppInit);

  FutureOr<dynamic> _checkForAppInit() {
    SplashAction.of(context).isAppInitialized().then((value) => value
        ? _handleAppInitialized() // check if needs to go to home page or login
        : _showDialogue());
  }

  Future _showDialogue() {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Action Needed"),
              content: Text("Please check your internet connection, "
                  "and your location permission for YTT app, and press "
                  "OK when you are done"),
              actions: <Widget>[
                RaisedButton(
                  child: Text("OK"),
                  onPressed: () {
                    Navigator.of(context).pop();
                    return _checkForAppInit();
                  },
                )
              ],
            ));
  }

  void _startAnimation() async {
    await Future(() {});
    setState(() {
      opacity = 1;
    });
  }

  void _handleAppInitialized() async {
    l.info("handling app init");
    var firstTime = await SplashAction.of(context).isFirstTime();

    var loggedIn = SplashAction.of(context).isLoggedIn();
    if (firstTime) {
      l.info("pushing to onboarding, first time $firstTime");
      Navigator.pushReplacementNamed(context, RouteName.onBoarding);
    } else if (loggedIn) {
      l.info("pushing to home, first time $firstTime and logged in $loggedIn");
      Navigator.pushReplacementNamed(context, RouteName.home);
    } else {
      l.info("pushing to login, first time $firstTime and logged in $loggedIn");
      Navigator.pushReplacementNamed(context, RouteName.login);
    }
  }
}
