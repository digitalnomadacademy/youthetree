import 'package:flutter/material.dart';


class ResizeWidget extends StatefulWidget {
  @override
  _ResizeWidgetState createState() => _ResizeWidgetState();
}

double containerHeight = 40;

class _ResizeWidgetState extends State<ResizeWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('neki text'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              child: Center(
                  child: Text(
                    'Red content',
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  )),
              decoration: BoxDecoration(color: Colors.red),
            ),
          ),
          Divider(
            height: 0,
            thickness: 1,
            color: Colors.black,
          ),
          GestureDetector(
            onVerticalDragStart: (DragStartDetails details) {},
            onVerticalDragUpdate: (DragUpdateDetails details) {
              setState(() {
                if ((details.delta.dy) < 0) {
                  if (containerHeight <= 500) {
                    containerHeight = containerHeight - details.delta.dy;
                  }
                }
                if (details.delta.dy > 0) {
                  if (containerHeight >= 40) {
                    containerHeight = containerHeight - details.delta.dy;
                  }
                }
                print('container height $containerHeight');
                print('delta ${details.delta}');
                print('local ${details.localPosition}');
              });
            },
            child: Container(
              height: containerHeight,
              child: Center(
                  child: Text(
                    'Green Content',
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  )),
              decoration: BoxDecoration(color: Colors.lightGreen),
            ),
          ),
        ],
      ),
    );
  }
}
