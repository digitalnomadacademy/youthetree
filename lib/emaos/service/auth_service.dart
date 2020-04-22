import 'dart:math';

class AuthService {
  Future<void> loginEmail(String email) {
    var random = Random();
    if (random.nextDouble() > 0.9) {
      throw Exception("mail does not exist");
    } else {
      return null;
    }
  }

  Future<void> loginPhone(String phone) {
    var random = Random();
    if (random.nextDouble() > 0.9) {
      throw Exception("phone does not exist");
    } else {
      return null;
    }
  }

  Future<void> confirmCode(String code) {
    var random = Random();
    if (random.nextDouble() > 0.9) {
      throw Exception("code incorrect");
    } else {
      return null;
    }
  }
}
