import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:youthetree/ui/molecule/code_input.dart';

class CodePopup extends StatefulWidget {
  @override
  _CodePopupState createState() => _CodePopupState();
}

class _CodePopupState extends State<CodePopup> {
  String _codeText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 100, right: 100, top: 100),
      child: SingleChildScrollView(
        child: Align(
          alignment: Alignment.topCenter,
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
                CodeInput(
                  onChanged: (text) => setState(() {
                    _codeText = text;
                  }),
                  onSubmit: (text) {
                    _codeText = text;
                    _submit();
                  },
                ),
                RaisedButton(
                  child: Text("Confirm"),
                  onPressed: _codeText.length == 4 ? () => _submit() : null,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _submit() {
    print(_codeText);
  }
}




