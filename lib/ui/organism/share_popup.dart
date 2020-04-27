
import 'package:flutter/material.dart';
import 'package:share/share.dart';

class SharePopupButton extends StatefulWidget {
  @override
  _SharePopupButtonState createState() => _SharePopupButtonState();
}

class _SharePopupButtonState extends State<SharePopupButton> {
  @override
  Widget build(BuildContext context) {
    final shareLink = 'www.youthetree.com';

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Here's Your Tree"),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 25, right: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            GestureDetector(
              child: Icon(Icons.share),
              onTap: () => Share.share(shareLink),
            ),
          ],
        ),
      ),
    );
  }
}