import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:youthetree/ui/organism/code_popup.dart';

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
        verificationCompleted: (AuthCredential credentials) async{
          AuthResult result=await _auth.signInWithCredential(credentials);
          FirebaseUser user = result.user;
          if(user!=null){print('user auto signed in');} //trebalo bi ici na home!!!
          } ,
        verificationFailed: ((_) => print("verification failed for $_")),
        codeSent: (String verificationId, [int forceResendingToken]){
          return CodePopup();
        },
        codeAutoRetrievalTimeout: (_) => "code auto retrieval timeout $_");
  }

//AuthCredential  credential = PhoneAuthProvider.getCredential(verificationId: verificationId, smsCode: null);


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
