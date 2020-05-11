import 'package:flutter/material.dart';
import 'package:youthetree/router/router.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var _emailController = TextEditingController();
  var _phoneController = TextEditingController();

//Focus Nodes
  var _phoneFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Spacer(),
            Text(
              'Login in with Email',
              style: TextStyle(fontSize: 20),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                controller: _emailController,
                textInputAction: TextInputAction.go,
                onEditingComplete: () => _phoneFocusNode.requestFocus(),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
              ),
            ),
            Text(
              'Or login with Phone',
              style: TextStyle(fontSize: 20),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Phone',
                ),
              ),
            ),
            Spacer(),
            Container(
              height: 50,
              width: 200,
              child: RaisedButton(
                textColor: Colors.white,
                color: Colors.green,
                child: Text('Login'),
                onPressed: () {
                  Navigator.pushNamed(context, RouteName.home );
                },
              ),
            ),
            Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(10),
                child: Text(
                  'Or',
                  style: TextStyle(fontSize: 20),
                )),
            Expanded(
              child: Container(
                height: 50,
                width: 200,
                child: RaisedButton(
                  textColor: Colors.white,
                  color: Colors.green,
                  child: Text('Create account'),
                  onPressed: () {
                    Navigator.pushNamed(context, "create"); //todo add route when created
                  },
                ),
              ),
            ),
            Spacer(flex: 3),
          ],
        ),
      ),
    );
  }
}
