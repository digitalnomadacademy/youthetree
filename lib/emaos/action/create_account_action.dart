import 'package:flutter/cupertino.dart';
import 'package:youthetree/emaos/service/auth_service.dart';
import 'package:youthetree/provider/provider.dart';

class CreateAccountA {
  final AuthService _authService;

  CreateAccountA(this._authService);

  Future<void> createAccountWithEmail(String email, String password) {
    return _authService.createAccountWithEmail(email, password);
  }

  Future<void> createAccountWithPhone(String phone) {
    return _authService.loginPhone(phone);
  }

  factory CreateAccountA.of(BuildContext context) =>
      CreateAccountA(StaticProvider.of(context));
}
