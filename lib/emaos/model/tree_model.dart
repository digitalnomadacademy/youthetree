import 'package:rxdart/rxdart.dart';
import 'package:youthetree/emaos/observable/location_observable.dart';
import 'package:youthetree/emaos/observable/tree_marker_observable.dart';
import 'package:youthetree/emaos/observable/tree_updates.dart';
import 'package:youthetree/emaos/service/tree_service.dart';
import 'package:youthetree/emaos/service/forest_service.dart';
import 'package:youthetree/logger/logger.dart';

class TreeModel {
//  DEPENDECIES
  final TreeService _treeService;
  final ForestService _forestService;

//  OBSERVABLES
  BehaviorSubject<TreeUpdateListObservable> treeUpdateListO$ =
      BehaviorSubject();
  BehaviorSubject<TreeMarkerSetObservable> treeMarkersSet$ = BehaviorSubject();

  List<TreeEntity> trees;
  List<ForestTreeEntity> forestTrees;
  TreeMarkerSetObservable markerObservable;

//  CONSTRUCTOR
  TreeModel(this._treeService, this._forestService) {
    _init();
  }

// PUBLIC METHODS
  void dispose() {
    treeUpdateListO$.close();
  }

//  PRIVATE METHODS

  void _init() async {
    treeUpdateListO$.add(_mockTreeUpdateO);
    await refreshTreeMarkers();
  }

  Future refreshTreeMarkers() async {
    trees = await _treeService.getTrees();
    forestTrees = await _forestService.getForest();
    markerObservable = TreeMarkerSetObservable(
        treeMarkers: trees
            .map<TreeMarkerObservable>(
              (TreeEntity tree) => TreeMarkerObservable(
                  location: LocationObservable(
                      latitude: tree.location.latitude,
                      longitude: tree.location.longitude),
                  treeId: tree.treeId,
                  isInOurForest: forestTrees
                      .any((forestTree) => forestTree.treeId == tree.treeId)),
            )
            .toSet());
    treeMarkersSet$.add(markerObservable);
    l.info("tree markes added $markerObservable");
  }
}

var _mockTreeUpdateO = TreeUpdateListObservable(
  list: [
    TreeUpdateO(
        treeName: "Cherry",
        treeId: "1",
        updateMessage: "Marko left a message",
        type: TreeUpdateType.newMessage),
    TreeUpdateO(
        treeName: "Cedar",
        treeId: "2",
        updateMessage: "There is new photo added",
        type: TreeUpdateType.newPhoto),
  ],
);
