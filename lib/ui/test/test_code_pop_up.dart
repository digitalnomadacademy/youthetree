import 'package:flutter/material.dart';
import 'package:youthetree/ui/organism/code_popup.dart';

class TestPopUp extends StatelessWidget {
  const TestPopUp({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        color: Colors.grey,
        child: Center(
          child: RaisedButton(
            child: Text("Open PopUp"),
            onPressed: () =>
                showDialog(context: context, builder: (context) => CodePopup()),
          ),
        ),
      ),
    );
  }
}
