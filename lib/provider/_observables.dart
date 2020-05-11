import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:youthetree/emaos/model/tree_model.dart';
import 'package:youthetree/emaos/observable/tree_updates.dart';
import 'package:youthetree/emaos/observable/user_observable.dart';
import 'package:youthetree/provider/provider.dart';

List<SingleChildWidget> observables = [
  Provider<UserO>(create: (context) => UserO(email: "youthetree@gmail.com")),
  StreamProvider<TreeUpdateListO>(
      initialData: TreeUpdateListO(),
      create: (context) =>
          StaticProvider.of<TreeModel>(context).treeUpdateListO$),
];
