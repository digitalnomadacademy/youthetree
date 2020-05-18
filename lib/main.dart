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
        theme: ThemeData.light().copyWith(
            scaffoldBackgroundColor: Colors.white,
            appBarTheme:
                AppBarTheme().copyWith(color: Colors.white, elevation: 0)),
        routes: routes,
        initialRoute: initialRoute,
      ),
    );
  }
}
