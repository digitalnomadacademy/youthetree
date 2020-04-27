import 'package:flutter/material.dart';
import 'package:youthetree/ui/molecule/resize_widget.dart';
import 'package:youthetree/ui/organism/tree_updates.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: ResizeWidget(
            topChild: TreeUpdates(),
            bottomChild: Container(
              color: Colors.blue,
              child: Center(
                child: Text("Google map goes here"),
              ),
            ),
          ),
        ),
      );
}
