import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:youthetree/provider/_models.dart';
import 'package:youthetree/provider/_observables.dart';
import 'package:youthetree/provider/_services.dart';

List<SingleChildWidget> providers = [
  ...services,
  ...models,
  ...observables,
];





class StaticProvider extends Provider {
  static T of<T>(BuildContext context) =>
      Provider.of<T>(context, listen: false);
}
