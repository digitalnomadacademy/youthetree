import 'package:youthetree/emaos/service/auth_service.dart';

class LoginAction {
  final AuthService _authService;

  LoginAction(this._authService);

  Future<void> loginEmail(String email) {
    return _authService.loginEmail(email);
  }

  Future<void> loginPhone(String phone) {
    return _authService.loginPhone(phone);
  }

  Future<void> confirmCode(String code) {
    return _authService.confirmCode(code);
  }
}

