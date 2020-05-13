import 'package:flutter/cupertino.dart';
import 'package:youthetree/emaos/observable/location_observable.dart';

class TreeMarkerSetObservable {
  final Set<TreeMarkerObservable> treeMarkers;

  const TreeMarkerSetObservable({
    this.treeMarkers,
  });
}

class TreeMarkerObservable {
  LocationObservable location;
  String treeId;
  bool isInOurForest;

  TreeMarkerObservable({
    @required this.location,
    @required this.treeId,
    this.isInOurForest = false,
  });
}
