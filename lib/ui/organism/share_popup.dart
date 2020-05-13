import 'package:flutter/material.dart';
import 'package:share/share.dart';

<<<<<<< HEAD
class SharePopup extends StatelessWidget {
  const SharePopup({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IconButton(
        onPressed: () => Share.share('https//www.youthetree.com'),
        icon: Icon(Icons.share),
=======
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
>>>>>>> 6cf6fa96eea9066a7f0af4be9d4370b452a0eb89
      ),
    );
  }
}
