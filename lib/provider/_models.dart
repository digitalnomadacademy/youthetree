import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:youthetree/emaos/model/location_model.dart';
import 'package:youthetree/emaos/model/tree_model.dart';
import 'package:youthetree/emaos/model/user_model.dart';
import 'package:youthetree/provider/provider.dart';

List<SingleChildWidget> models = [
  Provider<TreeModel>(
    create: (context) => TreeModel(
      StaticProvider.of(context),
      StaticProvider.of(context),
    ),
    lazy: false,
  ),
  Provider<UserModel>(
    create: (context) => UserModel(StaticProvider.of(context)),
    lazy: false,
  ),
  Provider<LocationModel>(
    create: (context) => LocationModel(StaticProvider.of(context)),
    lazy: false,
  ),
];
