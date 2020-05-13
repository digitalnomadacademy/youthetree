import 'package:flutter/material.dart';
import 'package:share/share.dart';

class ShareButton extends StatelessWidget {
  const ShareButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IconButton(
        onPressed: () => Share.share('https//www.youthetree.com'),
        icon: Icon(Icons.share),
      ),
    );
  }
}