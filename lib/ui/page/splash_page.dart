import 'dart:async';
import 'package:flutter/material.dart';
import 'package:youthetree/emaos/action/splash_action.dart';
import 'package:youthetree/logger/logger.dart';
import 'package:youthetree/router/router.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  double opacity = 0;
  AnimationController _controller;
  Animation<Offset> _animation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(251, 222, 214, 1),
      body: Stack(
        children: [
          Column(
            children: <Widget>[
              Expanded(
                child: Container(
                  color: Color.fromRGBO(251, 222, 214, 1),
                ),
              ),
              AnimatedOpacity(
                  duration: Duration(milliseconds: 2000),
                  opacity: opacity,
                  child: Image.asset("assets/tree.jpg")),
            ],
          ),
          SlideTransition(
            position: _animation,
            child: Text(
              'YTT',
              style: Theme.of(context).textTheme.headline1,
            ),
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _waitForAppInit();
    _startAnimation();

    _textAnimation();
    _controller.forward();
  }
  @override
  void dispose(){   // ova funkcija treba da se pozove ali ne znam gde?
    super.dispose();
    _controller.dispose();
  }

  Future _waitForAppInit() =>
      Future.delayed(Duration(milliseconds: 4500), _checkForAppInit);

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

  void _textAnimation() async {
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 5000));
    _animation = Tween<Offset>(begin: Offset(0.5, -3.0), end: Offset(0.5, 0.4))
        .animate(CurvedAnimation(parent: _controller, curve: Curves.linearToEaseOut));


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
