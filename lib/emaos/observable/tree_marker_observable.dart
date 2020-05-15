import 'package:flutter/cupertino.dart';
import 'package:youthetree/emaos/observable/location_observable.dart';

class TreeMarkerSetObservable {
  final Set<TreeMarkerObservable> treeMarkers;

  TreeMarkerSetObservable({
    this.treeMarkers = const <TreeMarkerObservable>{},
  });

  @override
  String toString() {
    return 'TreeMarkerSetObservable{treeMarkers: ${treeMarkers.length}, first:${treeMarkers.first}';
  }
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

  @override
  String toString() {
    return 'TreeMarkerObservable{location: $location, treeId: $treeId, isInOurForest: $isInOurForest}';
  }
}
