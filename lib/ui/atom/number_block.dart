import 'package:flutter/material.dart';

class NumberBlock extends StatelessWidget {
  const NumberBlock({
    Key key,
    @required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 30,
        height: 40,
        color: Colors.grey[300],
        child: Center(
            child: Text(
          text,
          style: TextStyle(fontSize: 20),
        )),
      ),
    );
  }
}
