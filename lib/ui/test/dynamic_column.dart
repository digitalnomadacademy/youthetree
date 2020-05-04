import 'package:flutter/material.dart';
import 'package:youthetree/ui/molecule/resize_widget.dart';

class DynamicColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ResizeWidget(
      dividerPercentage: 0.7,
      upperBorder: 0.2,
      topChild: Container(
        child: Center(
          child: Text(
            'Top Child',
            style: TextStyle(
              fontSize: 30,
            ),
          ),
        ),
        decoration: BoxDecoration(color: Colors.red),
      ),
      bottomChild: Container(
        child: Center(
          child: Text(
            'Bottom Child',
            style: TextStyle(
              fontSize: 30,
            ),
          ),
        ),
        decoration: BoxDecoration(color: Colors.blue),
      ),
    ));
  }
}
