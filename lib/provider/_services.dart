import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:youthetree/emaos/service/auth_service.dart';
import 'package:youthetree/emaos/service/forest_service.dart';
import 'package:youthetree/emaos/service/location_service.dart';
import 'package:youthetree/emaos/service/tree_service.dart';
import 'package:youthetree/emaos/service/user_service.dart';
import 'package:youthetree/provider/provider.dart';

List<SingleChildWidget> services = [
  Provider<AuthService>(
    create: (context) => AuthService(),
  ),
  Provider<LocationService>(
    create: (context) => LocationService(),
    lazy: false,
  ),
  Provider<UserService>(
    create: (context) => UserService(
      StaticProvider.of(context),
    ),
  ),
  Provider<ForestService>(
    create: (context) => ForestService(
      StaticProvider.of(context),
    ),
  ),
  Provider<TreeService>(
    create: (context) => TreeService(),
  ),
];
