import 'package:flutter/material.dart';
import 'package:youthetree/ui/atom/email_phone_radio_button.dart';
import 'package:youthetree/ui/organism/create_account_form.dart';

class CreateAccountPage extends StatefulWidget {
  @override
  _CreateAccountPageState createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  AuthType _chosenAuthType = AuthType.email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Text(
              "Create account",
              style: Theme.of(context).textTheme.title,
            ),
            SizedBox(
              height: 20,
            ),
            Text("EMAIL / PHONE"),
            EmailPhoneRadioButton(
              chosenAuthType: _chosenAuthType,
              onChanged: (type) => setState(() {
                _chosenAuthType = type;
              }),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child:
                  _chosenAuthType == AuthType.email ? EmailForm() : PhoneForm(),
            )
          ],
        ),
      ),
    );
  }
}

