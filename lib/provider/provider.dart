import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:youthetree/emaos/action/login_action.dart';
import 'package:youthetree/emaos/observable/user_observable.dart';
import 'package:youthetree/emaos/service/auth_service.dart';

List<SingleChildWidget> providers = [
  ...services,
  ...actions,
  ...observables,
];

List<SingleChildWidget> services = [
  Provider<AuthService>(
    create: (context) => AuthService(),
  ),
];

List<SingleChildWidget> actions = [
  Provider<LoginA>(
    create: (context) => LoginA(Provider.of(context, listen: false)),
  ),
];

List<SingleChildWidget> observables = [
  Provider<UserO>(create: (context) => UserO(email: "youthetree@gmail.com")),
];

//List<int> brojevi = [1, 2, 3];
//List<int> minusBrojevi = [-1, -3, -5];
//
//List<int> sveSkupa = [...brojevi, ...minusBrojevi]; // [1,2,3,-1,-3,-5]

class StaticProvider extends Provider {
  static T of<T>(BuildContext context) =>
      Provider.of<T>(context, listen: false);
}
