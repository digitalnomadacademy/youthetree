import 'package:flutter/material.dart';
import 'package:youthetree/emaos/action/create_account_action.dart';
import 'package:youthetree/emaos/action/login_action.dart';
import 'package:youthetree/router/router.dart';

class EmailForm extends StatefulWidget {
  @override
  _EmailFormState createState() => _EmailFormState();
}

class _EmailFormState extends State<EmailForm> {
  var formKey = GlobalKey<FormState>();

  var _isObscure = true;

  String _email;
  String _password;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                flex: 10,
                child: TextFormField(
                  onSaved: (value) => _email = value,
                  validator: (value) => value.contains("@") &&
                          value.contains(".") &&
                          value.length > 10
                      ? null
                      : "Email is not valid",
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: "Email",
                  ),
                ),
              ),
              Spacer(
                flex: 2,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                flex: 10,
                child: TextFormField(
                  onSaved: (value) => _password = value,
                  validator: (value) => value.length >= 6
                      ? null
                      : "Passwords must have min 6 chars",
                  obscureText: _isObscure,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: "Password",
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: IconButton(
                  icon: Icon(
                      _isObscure ? Icons.visibility_off : Icons.visibility),
                  onPressed: () => setState(() {
                    _isObscure = !_isObscure;
                  }),
                ),
              )
            ],
          ),
          RaisedButton(
            child: Text("Create Account"),
            onPressed: _onCreateAccountPressed,
          )
        ],
      ),
    );
  }

  void _onCreateAccountPressed() {
    var validation = formKey.currentState.validate();
    if (validation) {
      formKey.currentState.save();
      print("login with $_email $_password");
      CreateAccountA.of(context)
          .createAccountWithEmail(_email, _password)
          .then((_) => Navigator.of(context).pushNamed(RouteName.home))
          .catchError((e) => Scaffold.of(context).showSnackBar(SnackBar(
                content: Text(e.toString()),
              )));
    }
  }
}

class PhoneForm extends StatefulWidget {
  @override
  _PhoneFormState createState() => _PhoneFormState();

}

class _PhoneFormState extends State<PhoneForm> {
  var formKey = GlobalKey<FormState>();
  String _phone;


  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                flex: 10,
                child: TextFormField(
                  onSaved: (value) => _phone = value,
                  validator: (value) =>
                      value.length > 10
                      ? null
                      : "enter new phone",
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: "phone",
                  ),
                ),
              ),
              Spacer(
                flex: 2,
              ),
            ],
          ),


          RaisedButton(
            child: Text("Submit phone"),
            onPressed: _submitPhonePressed,
          )
        ],
      ),
    );
  }
  void _submitPhonePressed() {
    var validation = formKey.currentState.validate();
    if (validation) {
      formKey.currentState.save();
      print("login with $_phone");
      LoginA.of(context)
          .loginPhone(_phone)
          .then((_) => Navigator.of(context).pushNamed(RouteName.home))
          .catchError((e) => Scaffold.of(context).showSnackBar(SnackBar(
        content: Text(e.toString()),
      )));
    }
  }
}
