import 'package:flutter/material.dart';

class ResizeWidget extends StatefulWidget {
  final Widget topChild;
  final Widget bottomChild;
  final double dividerPercentage;
  ResizeWidget({this.topChild, this.bottomChild, this.dividerPercentage});

  @override
  _ResizeWidgetState createState() => _ResizeWidgetState();
}

class _ResizeWidgetState extends State<ResizeWidget> {
  double _currentPercentage;
  double _currentPosition;
  @override
  void initState() {
    // TODO: implement initState
    _currentPercentage = widget.dividerPercentage;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: GestureDetector(
        onVerticalDragStart: (DragStartDetails details) {
          _currentPosition =
              _currentPercentage * (MediaQuery.of(context).size.height);
        },
        onVerticalDragUpdate: (DragUpdateDetails details) {
          setState(() {
            if ((details.globalPosition.dy) - _currentPosition <= 30 &&
                _currentPosition - (details.globalPosition.dy) <= 30) {
              if (_currentPercentage <= widget.dividerPercentage) {
                _currentPosition = _currentPosition + details.delta.dy;
                _currentPercentage =
                    _currentPosition / (MediaQuery.of(context).size.height);
              }
            }
            print('current% $_currentPercentage');
            print('divider% ${widget.dividerPercentage}');
//           print (details.globalPosition);
//            print('global ${details.globalPosition.dy}');
//            print('current position $_currentPosition');
//            print(MediaQuery.of(context).size.height);
          });
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
                flex: (_currentPercentage * 100).toInt(),
                child: widget.topChild),
            Divider(
              height: 0,
              thickness: 1,
              color: Colors.black,
            ),
            Expanded(
              flex: ((1 - _currentPercentage) * 100).toInt(),
              child: widget.bottomChild,
            )
          ],
        ),
      ),
    );
  }
}