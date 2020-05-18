import 'package:flutter/material.dart';
import 'package:youthetree/emaos/action/login_action.dart';
import 'package:youthetree/router/router.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var _emailController = TextEditingController();
  var _passwordController = TextEditingController();
  var _phoneController = TextEditingController();

//Focus Nodes
  var _phoneFocusNode = FocusNode();

  String get email => _emailController.text;
  String get password => _passwordController.text;
  String get phone => _phoneController.text;

  LoginState get loginState => email.isEmpty && phone.isEmpty
      ? LoginState.ready
      : email.isNotEmpty ? LoginState.email : LoginState.phone;

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
            SizedBox(
              height: 30,
            ),
            loginState == LoginState.phone
                ? Container()
                : Text(
                    'Login in with Email',
                    style: TextStyle(fontSize: 20),
                  ),
            loginState == LoginState.phone
                ? Container()
                : Container(
                    padding: EdgeInsets.all(10),
                    child: TextFormField(
                      controller: _emailController,
                      onChanged: (_)=>setState(() {

                      }),
                      textInputAction: TextInputAction.go,
                      onEditingComplete: () => _phoneFocusNode.requestFocus(),
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Email',
                      ),
                    ),
                  ),
            loginState == LoginState.phone
                ? Container()
                : Container(
                    padding: EdgeInsets.all(10),
                    child: TextFormField(
                      controller: _passwordController,
                      textInputAction: TextInputAction.done,
                      onChanged: (_)=>setState(() {

                      }),
                      onEditingComplete: () => _phoneFocusNode.requestFocus(),
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Password',
                      ),
                    ),
                  ),
            loginState == LoginState.email
                ? Container()
                : Text(
                    'Login with Phone',
                    style: TextStyle(fontSize: 20),
                  ),
            loginState == LoginState.email
                ? Container()
                : Container(
                    padding: EdgeInsets.all(10),
                    child: TextFormField(
                      onChanged: (_)=>setState(() {

                      }),
                      controller: _phoneController,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
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
                onPressed: loginState == LoginState.ready
                    ? null
                    : () async {
                        try {
                          if (loginState == LoginState.phone) {
                            await LoginAction.of(context).loginPhone(phone);
                            Navigator.pushNamed(context, RouteName.home);
                          } else if (loginState == LoginState.email) {
                            await LoginAction.of(context)
                                .loginEmail(email, password);
                            Navigator.pushNamed(context, RouteName.home);
                          }
                        } catch (e) {
                          Scaffold.of(context).showSnackBar(SnackBar(
                            content: Text(e.toString()),
                          ));
                        }
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
                child: FlatButton(
                  textColor: Colors.blue,
                  child: Text('Create account',style: TextStyle(fontSize: 18),),
                  onPressed: () {
                    Navigator.pushNamed(context, RouteName.createAccount);
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

enum LoginState { email, phone, ready }
