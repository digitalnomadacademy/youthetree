import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:youthetree/emaos/model/tree_model.dart';
import 'package:youthetree/provider/provider.dart';

List<SingleChildWidget> models = [
  Provider<TreeModel>(
    create: (context) => TreeModel(StaticProvider.of(context)),
  ),
];
