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
      child: IconButton(
        icon: Icon(Icons.add),
        onPressed: () async {
          var image = await ImagePicker.pickImage(source: ImageSource.camera);
          if (image != null) {
            return TreeAction.of(context).addTreeImage(image);
          }
        },
      ),
    );
  }
}

class CreateYourMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: IconButton(
        icon: Icon(Icons.add),
        onPressed: () => print("add pressed"),
      ),
    );
  }
}
