import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:youthetree/emaos/action/login_action.dart';
import 'package:youthetree/emaos/service/auth_service.dart';

List<SingleChildWidget> providers = [
  ...services,
  ...actions,
];

List<SingleChildWidget> services = [
  Provider<AuthService>(
    create: (context) => AuthService(),
  ),
];

List<SingleChildWidget> actions = [
  Provider<LoginAction>(
    create: (context) =>
        LoginAction(Provider.of(context, listen: false)),
  ),
];

//List<int> brojevi = [1, 2, 3];
//List<int> minusBrojevi = [-1, -3, -5];
//
//List<int> sveSkupa = [...brojevi, ...minusBrojevi]; // [1,2,3,-1,-3,-5]
