import 'dart:io';

import 'package:flutter/material.dart';
import 'package:youthetree/emaos/service/tree_service.dart';
import 'package:youthetree/provider/provider.dart';

class TreeAction {
  final TreeService _treeService;

  TreeAction(this._treeService);

  Future<void> addTreeImage(File image, [String treeId]){
    if (treeId != null ) {
      return _treeService.updateTreeImage(image, treeId);
    } else {
      return _treeService.createTreeWithImage(image);
    }
  }

  factory TreeAction.of(BuildContext context) =>
      TreeAction(StaticProvider.of(context));
}
