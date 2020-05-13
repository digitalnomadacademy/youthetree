import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';
import 'package:youthetree/emaos/service/auth_service.dart';

class UserService {
  AuthService _authService;

  Firestore _firestore = Firestore.instance;

  BehaviorSubject<UserEntity> user$ = BehaviorSubject();

  StreamSubscription<DocumentSnapshot> userListener;

  UserService(this._authService) {
    _authService.firebaseUser$.listen(_authListener);
  }

  Future<void> createNewUser(String uid, String name,
      {String email, String phone}) {
    var data = {"name": name, "email": email, phone: "phone", "forest": []};
    return _firestore.collection('users').document(uid).setData(data);
  }

//  PRIVATE
  void _authListener(FirebaseUser firebaseUser) {
    if (firebaseUser != null) {
      userListener = _firestore
          .collection('users')
          .document(firebaseUser.uid)
          .snapshots()
          .listen((event) => _userListener(event, firebaseUser));
    } else {
      if (userListener != null) {
        userListener.cancel();
        user$.add(null);
      }
    }
  }

  void _userListener(DocumentSnapshot event, FirebaseUser user) {
    if (event.exists && event.data.isNotEmpty) {
      var userEntity = UserEntity.fromMap(event.data, user.uid,
          email: user.email, phone: user.phoneNumber);
      user$.add(userEntity);
      print("user entity added");
      print(userEntity);
    }
  }

  Future getForest() {}
}

class UserEntity {
  final String name;
  final String email;
  final String phone;

  ///List of tree ids that are in the user forest.
  final List<String> forest;

  final String uid;

  const UserEntity({this.email, this.phone, this.name, this.forest, this.uid});

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'forest': this.forest,
    };
  }

  factory UserEntity.fromMap(Map<String, dynamic> map, String uid,
      {String email, String phone}) {
    return UserEntity(
        name: map['name'] as String,
        email: email,
        phone: phone,
        forest: map['forest'].map<String>((value) => value.toString()).toList(),
        uid: uid);
  }

  @override
  String toString() {
    return 'UserEntity{name: $name, email: $email, phone: $phone, forest: $forest, uid: $uid}';
  }
}
