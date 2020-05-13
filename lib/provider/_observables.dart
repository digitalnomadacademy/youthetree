import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:youthetree/emaos/model/location_model.dart';
import 'package:youthetree/emaos/model/tree_model.dart';
import 'package:youthetree/emaos/model/user_model.dart';
import 'package:youthetree/emaos/observable/location_observable.dart';
import 'package:youthetree/emaos/observable/tree_updates.dart';
import 'package:youthetree/emaos/observable/user_observable.dart';
import 'package:youthetree/provider/provider.dart';

List<SingleChildWidget> observables = [
  Provider<UserObservable>(
      create: (context) => UserObservable(email: "youthetree@gmail.com")),
  StreamProvider<TreeUpdateListObservable>(
      initialData: TreeUpdateListObservable(),
      create: (context) =>
          StaticProvider.of<TreeModel>(context).treeUpdateListO$),
  StreamProvider<UserObservable>(
      initialData: UserObservable(),
      create: (context) => StaticProvider.of<UserModel>(context).user$),
  StreamProvider<LocationObservable>(
      initialData: LocationObservable(),
      create: (context) => StaticProvider.of<LocationModel>(context).location$),
];
