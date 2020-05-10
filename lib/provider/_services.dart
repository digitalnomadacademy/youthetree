import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:youthetree/emaos/service/auth_service.dart';
import 'package:youthetree/emaos/service/tree_service.dart';

List<SingleChildWidget> services = [
  Provider<AuthService>(
    create: (context) => AuthService(),
  ),
  Provider<TreeService>(
    create: (context) => TreeService(),
  ),
];
