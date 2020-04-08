import 'package:flutter/material.dart';
import 'package:youthetree/ui/molecule/code_popup.dart';

void main() {
  runApp(YTT());
}

class YTT extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          height: double.infinity,
          color: Colors.grey,
          child: CodePopup(),
        ),
      ),
    );
  }
}
