import 'package:rxdart/rxdart.dart';
import 'package:youthetree/emaos/observable/user_observable.dart';
import 'package:youthetree/emaos/service/user_service.dart';

class UserModel {
  final UserService _userService;

  BehaviorSubject<UserO> user$ = BehaviorSubject();

  UserModel(this._userService){
    _userService.user$.listen(_userEntityListener);
  }

  void _userEntityListener(UserEntity userEntity) {
    user$.add(UserO.fromMap(userEntity.toMap()));
  }
}