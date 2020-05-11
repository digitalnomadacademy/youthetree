import 'package:flutter/cupertino.dart';
import 'package:youthetree/emaos/service/auth_service.dart';
import 'package:youthetree/emaos/service/user_service.dart';
import 'package:youthetree/provider/provider.dart';

class CreateAccountA {
  final AuthService _authService;
  final UserService _userService;

  CreateAccountA(this._authService, this._userService);

  Future<void> createAccountWithEmail(String email, String password, String name) async {
    var firebaseUser =
        await _authService.createAccountWithEmail(email, password);
    _userService.createNewUser(firebaseUser.uid, name);
  }

  Future<void> createAccountWithPhone(String phone) {
    return _authService.loginPhone(phone);
  }

  factory CreateAccountA.of(BuildContext context) => CreateAccountA(
        StaticProvider.of(context),
        StaticProvider.of(context),
      );
}
