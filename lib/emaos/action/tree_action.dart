import 'dart:io';

import 'package:flutter/material.dart';
import 'package:youthetree/emaos/model/tree_model.dart';
import 'package:youthetree/emaos/service/auth_service.dart';
import 'package:youthetree/emaos/service/location_service.dart';
import 'package:youthetree/emaos/service/tree_service.dart';
import 'package:youthetree/logger/logger.dart';
import 'package:youthetree/provider/provider.dart';

class TreeAction {
  final TreeService _treeService;
  final AuthService _authService;
  final LocationService _locationService;
  final TreeModel _treeModel;

  TreeAction(this._treeService, this._authService, this._locationService, this._treeModel);

  Future<void> addTreeImage(File image, [String treeId]) async {
    l.info("add tree image action called");
    if (treeId != null) {
      return _treeService.updateTreeImage(image, treeId, _authService.uid);
    } else {
      l.info("creating new tree");
      var currentLocation = _locationService.currentLocation;
      l.info("current location is $currentLocation");
      await _treeService.createTreeWithImage(
          image, _authService.uid, currentLocation);
      l.info("tree created");
    }
  }
  void refreshTreeMarkers() => _treeModel.refreshTreeMarkers();

  factory TreeAction.of(BuildContext context) => TreeAction(
        StaticProvider.of(context),
        StaticProvider.of(context),
        StaticProvider.of(context),
        StaticProvider.of(context),
      );

}
