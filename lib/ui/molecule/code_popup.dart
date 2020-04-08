import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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

class CodeInput extends StatefulWidget {
  final Function(String) onChanged;
  final Function(String) onSubmit;

  CodeInput({this.onChanged, this.onSubmit});

  @override
  _CodeInputState createState() => _CodeInputState();
}

class _CodeInputState extends State<CodeInput> {
  var _focusNode = FocusNode();
  var _textController = TextEditingController();

  String get first =>
      _textController.text.length > 0 ? _textController.text[0] : "";
  String get second =>
      _textController.text.length > 1 ? _textController.text[1] : "";
  String get third =>
      _textController.text.length > 2 ? _textController.text[2] : "";
  String get fourth =>
      _textController.text.length > 3 ? _textController.text[3] : "";

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Opacity(
            opacity: 0,
            child: TextField(
              maxLength: 4,
              keyboardType: TextInputType.number,
              focusNode: _focusNode,
              controller: _textController,
              onChanged: (text) => setState(() {
                widget?.onChanged(text);
              }),
              onSubmitted: (text) => widget?.onSubmit(text),
            )),
        GestureDetector(
          onTap: () => _focusNode.requestFocus(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              NumberBlock(text: first),
              NumberBlock(text: second),
              NumberBlock(text: third),
              NumberBlock(text: fourth),
            ],
          ),
        ),
      ],
    );
  }
}

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
