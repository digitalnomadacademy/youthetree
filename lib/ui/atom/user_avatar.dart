import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youthetree/emaos/observable/user_observable.dart';

class UserAvatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<UserO>(builder: (context, UserO userO, child) {
      return CircleAvatar(
        child: Text(_getInitials(userO)),
      );
    });
  }

  String _getInitials(UserO userO) {
    String text;
    if (userO.email != null) {
      text = userO.email;
    } else {
      text = userO.phone;
    }

    return text.substring(0, 2);
  }
}
