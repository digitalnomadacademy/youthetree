import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:youthetree/emaos/service/auth_service.dart';

class UserService {
  Firestore _firestore = Firestore.instance;
  AuthService _authService;

  UserService(this._authService);


}

class UserEntity {
  final String name;

  ///List of tree ids that are in the user forest.
  final List<String> forest;

  const UserEntity({
    @required this.name,
    @required this.forest,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'forest': this.forest,
    };
  }

  factory UserEntity.fromMap(Map<String, dynamic> map) {
    return UserEntity(
      name: map['name'] as String,
      forest: map['forest'] as List<String>,
    );
  }
}
