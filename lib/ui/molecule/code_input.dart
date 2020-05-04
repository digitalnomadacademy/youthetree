import 'package:flutter/material.dart';
import 'package:youthetree/ui/atom/number_block.dart';

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
