import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youthetree/provider/provider.dart';
import 'package:youthetree/router/router.dart';

void main() {
  runApp(YTT());
}

class YTT extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        routes: routes,
        initialRoute: initialRoute,
      ),
    );
  }
}
