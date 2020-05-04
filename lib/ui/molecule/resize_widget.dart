import 'package:flutter/material.dart';

class ResizeWidget extends StatelessWidget {
  final Widget topChild;
  final Widget bottomChild;
  final double dividerPercentage;
  ResizeWidget({
    @required this.topChild,
    @required this.bottomChild,
    this.dividerPercentage,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(flex: (dividerPercentage * 100).toInt(), child: topChild),
        Divider(
          height: 0,
          thickness: 1,
          color: Colors.black,
        ),
        Expanded(
          flex: ((1 - dividerPercentage) * 100).toInt(),
          child: bottomChild,
        )
      ],
    );
  }
}
