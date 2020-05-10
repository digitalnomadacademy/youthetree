import 'package:flutter/cupertino.dart';
import 'package:youthetree/emaos/service/auth_service.dart';
import 'package:youthetree/provider/provider.dart';

class LoginA {
  final AuthService _authService;

  LoginA(this._authService);

  Future<void> loginEmail(String email) {
    return _authService.loginEmail(email);
  }

  Future<void> loginPhone(String phone) {
    return _authService.loginPhone(phone);
  }

  Future<void> confirmCode(String code) {
    return _authService.confirmCode(code);
  }

  factory LoginA.of(BuildContext context) =>
      LoginA(StaticProvider.of(context));
}
