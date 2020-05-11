import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';
import 'package:youthetree/emaos/service/auth_service.dart';

class UserService {
  Firestore _firestore = Firestore.instance;
  AuthService _authService;

  BehaviorSubject<UserEntity> user$ = BehaviorSubject();

  StreamSubscription<DocumentSnapshot> userListener;

  UserService(this._authService) {
    _authService.firebaseUser$.listen(_authListener);
  }

  void _authListener(FirebaseUser firebaseUser) {
    if (firebaseUser.uid != null) {
      userListener = _firestore
          .collection('users')
          .document(firebaseUser.uid)
          .snapshots()
          .listen((event) => _userListener(event, firebaseUser.uid));
    } else {
      if (userListener != null) {
        userListener.cancel();
        user$.add(null);
      }
    }
  }

  void _userListener(DocumentSnapshot event, String uid) {
    if (event.exists && event.data.isNotEmpty) {
      user$.add(UserEntity.fromMap(event.data, uid));
    }
  }

  Future<void> createNewUser(String uid, String name) {
    var data = {"name": name, "forest": []};
    return _firestore.collection('users').document(uid).setData(data);
  }
}

class UserEntity {
  final String name;

  ///List of tree ids that are in the user forest.
  final List<String> forest;

  final String uid;

  const UserEntity({this.name, this.forest, this.uid});

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'forest': this.forest,
    };
  }

  factory UserEntity.fromMap(Map<String, dynamic> map, String uid) {
    return UserEntity(
        name: map['name'] as String,
        forest: map['forest'].map((value) => value.toString()).toList(),
        uid: uid);
  }
}
