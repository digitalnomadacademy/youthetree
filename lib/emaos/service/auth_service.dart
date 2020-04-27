import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;

  AuthService() {
    _auth.onAuthStateChanged
        .listen((authState) => print("authStateChanged $authState"));
  }

  Future<void> loginEmail(String email, String password) {
    return _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> loginPhone(String phone) {
    return _auth.verifyPhoneNumber(
        phoneNumber: phone,
        timeout: Duration(seconds: 120),
        verificationCompleted: ((_) => print("verification complete for $_")),
        verificationFailed: ((_) => print("verification failed for $_")),
        codeSent: (_, [__]) => print("code sent $_ $__"),
        codeAutoRetrievalTimeout: (_) => "code auto retrieval timeout $_");
  }

  Future<void> confirmCode(String code) {
    var random = Random();
    if (random.nextDouble() > 0.9) {
      throw Exception("code incorrect");
    } else {
      return null;
    }
  }

  Future<void> createAccountWithEmail(String email, String password) async {
    print("AuthService");
    print("create account called with $email $password");
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      print("Create account error");
      print(e);
      throw e;
    }
  }
}
