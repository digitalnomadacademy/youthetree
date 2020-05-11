import 'package:flutter/cupertino.dart';
import 'package:youthetree/emaos/service/auth_service.dart';
import 'package:youthetree/provider/provider.dart';

class LoginAction {
  final AuthService _authService;

  LoginAction(this._authService);

  Future<void> loginEmail(String email, String password) {
    return _authService.loginEmail(email, password);
  }

  Future<void> loginPhone(String phone) {
    return _authService.loginPhone(phone);
  }

  Future<void> confirmCode(String code) {
    return _authService.confirmCode(code);
  }

  factory LoginAction.of(BuildContext context) => LoginAction(StaticProvider.of(context));
}
