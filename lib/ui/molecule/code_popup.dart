import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CodePopup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 100, right: 100, top: 100),
      child: Align(
        alignment: Alignment.topCenter,
        child: Container(
          color: Colors.white,
          height: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text("Enter Code",style: TextStyle(fontSize: 30),),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 30,
                      height: 40,
                      color: Colors.grey[300],
                      child: Text(""),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 30,
                      height: 40,
                      color: Colors.grey[300],
                      child: Text(""),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 30,
                      height: 40,
                      color: Colors.grey[300],
                      child: Text(""),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 30,
                      height: 40,
                      color: Colors.grey[300],
                        child: Text(""),
                    ),
                  ),
                ],
              ),
              RaisedButton(
                child: Text("Confirm"),
                onPressed: () => print('Confirm pressed'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
