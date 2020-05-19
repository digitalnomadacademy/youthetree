import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:youthetree/emaos/action/tree_action.dart';
import 'package:youthetree/ui/molecule/resize_widget.dart';

class NewMessagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResizeWidget(
        topChild: AddTreePhoto(),
        bottomChild: CreateYourMessage(),
        dividerPercentage: .3,
      ),
    );
  }
}

class AddTreePhoto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          border: Border.all(color: Colors.green, width: 1),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 0.5,
              blurRadius: 0.5,
              offset: Offset(2, 3), // changes position of shadow
            ),
          ],
//          gradient: LinearGradient(
//            colors: [Colors.white, Colors.yellow[100]],
//          ),
        ),
        child: IconButton(
          icon: Icon(
            Icons.add_a_photo,
            color: Colors.green,
          ),
          onPressed: () async {
            var image = await ImagePicker.pickImage(source: ImageSource.camera);
            if (image != null) {
              return TreeAction.of(context).addTreeImage(image);
            }
          },
        ),
      ),
    );
  }
}

class CreateYourMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(width: 1, color: Colors.green),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 0.5,
                blurRadius: 0.5,
                offset: Offset(2, 3), // changes position of shadow
              )
            ]),
        child: IconButton(
          icon: Icon(Icons.mail),
          color: Colors.green,
          onPressed: () => print("add pressed"),
        ),
      ),
    );
  }
}
