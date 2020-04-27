import 'package:flutter/material.dart';

class EmailPhoneRadioButton extends StatelessWidget {
  final AuthType chosenAuthType;
  final Function(AuthType) onChanged;

  const EmailPhoneRadioButton({Key key, this.chosenAuthType, this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Radio<AuthType>(
          value: AuthType.email,
          groupValue: chosenAuthType,
          onChanged: onChanged,
        ),
        Radio<AuthType>(
          value: AuthType.phone,
          groupValue: chosenAuthType,
          onChanged: onChanged,
        ),
      ],
    );
  }
}

enum AuthType { email, phone }
