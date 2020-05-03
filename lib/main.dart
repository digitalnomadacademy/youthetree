import 'package:flutter/material.dart';
import 'package:youthetree/router/router.dart';
//import 'package:youthetree/ui/molecule/map_widget.dart';

void main() {
  runApp(YTT());
}

class YTT extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: routes,
      initialRoute: initialRoute,
    );
  }
}
