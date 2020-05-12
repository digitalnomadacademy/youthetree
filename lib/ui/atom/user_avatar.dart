import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youthetree/emaos/action/login_action.dart';
import 'package:youthetree/emaos/observable/user_observable.dart';
import 'package:youthetree/router/router.dart';

class UserAvatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<UserO>(builder: (context, UserO userO, child) {
      return GestureDetector(
        onTap: () => showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text("Log Out"),
                  content: Text("Do you want to log out?"),
                  actions: <Widget>[
                    FlatButton(
                      child: Text("CANCEL"),
                      onPressed: () => Navigator.pop(context),
                    ),
                    RaisedButton(
                      color: Colors.red[300],
                      child: Text("LOG OUT"),
                      onPressed: () async {
                        await LoginAction.of(context).logOut();
                        Navigator.pushNamed(context, RouteName.login);
                      },
                    ),
                  ],
                )),
        child: CircleAvatar(
          child: Text(_getInitials(userO)),
        ),
      );
    });
  }

  String _getInitials(UserO userO) {
    String text;
    if (userO.name != null) {
      text = userO.name.substring(0, 2);
    } else {
      text = "NN";
    }

    return text;
  }
}
