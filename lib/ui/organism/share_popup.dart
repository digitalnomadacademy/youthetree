import 'package:flutter/material.dart';
import 'package:share/share.dart';

class SharePopupButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: IconButton(
        padding: const EdgeInsets.all(50.0),
        alignment: Alignment.topRight,
        onPressed: () => Share.share('https//www.youthetree.com'),
        icon: Icon(
          Icons.share
        ),
      ),
    );
  }
}
