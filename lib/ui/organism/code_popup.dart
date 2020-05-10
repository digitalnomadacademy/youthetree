import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:youthetree/emaos/action/login_action.dart';
import 'package:youthetree/router/router.dart';
import 'package:youthetree/ui/molecule/code_input.dart';

class CodePopup extends StatefulWidget {
  @override
  _CodePopupState createState() => _CodePopupState();
}

class _CodePopupState extends State<CodePopup> {
  String _codeText = "";

  bool _error = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 100, right: 100, top: 100),
      child: SingleChildScrollView(
        child: Align(
          alignment: Alignment.topCenter,
          child: Material(
            type: MaterialType.transparency,
            child: Container(
              color: Colors.white,
              height: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    "Enter Code",
                    style: TextStyle(fontSize: 30),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: _error ? Colors.red : Colors.transparent)),
                    child: CodeInput(
                      onChanged: (text) => setState(() {
                        _codeText = text;
                      }),
                      onSubmit: (text) {
                        if (_codeText.length == 4) {
                          _codeText = text;
                          _submit();
                        }
                      },
                    ),
                  ),
                  _error
                      ? Text(
                          "Code Error",
                          style: TextStyle(color: Colors.red),
                        )
                      : Container(),
                  RaisedButton(
                    child: Text("Confirm"),
                    onPressed: _codeText.length == 4 ? () => _submit() : null,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _submit() async {
    try {
      await LoginA.of(context).confirmCode(_codeText);
      Navigator.pop(context);
      Navigator.pushNamed(context, RouteName.home);
      print(_codeText);
    } catch (e) {
      setState(() {
        _error = true;
      });
    }
  }
}
