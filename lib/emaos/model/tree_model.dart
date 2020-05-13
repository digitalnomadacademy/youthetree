import 'package:rxdart/rxdart.dart';
import 'package:youthetree/emaos/observable/tree_marker_observable.dart';
import 'package:youthetree/emaos/observable/tree_updates.dart';
import 'package:youthetree/emaos/service/tree_service.dart';
import 'package:youthetree/emaos/service/user_service.dart';

class TreeModel {
//  DEPENDECIES
  final TreeService _treeService;
  final UserService _userService;

//  OBSERVABLES
  BehaviorSubject<TreeUpdateListObservable> treeUpdateListO$ = BehaviorSubject();
  BehaviorSubject<TreeMarkerSetObservable> treeMarkersSet$ = BehaviorSubject();

//  CONSTRUCTOR
  TreeModel(this._treeService, this._userService) {
    _init();
  }

// PUBLIC METHODS
  void dispose() {
    treeUpdateListO$.close();
  }

//  PRIVATE METHODS

  void _init() async {
    treeUpdateListO$.add(_mockTreeUpdateO);
    var trees = await _treeService.getTrees();
    var userTrees = await _userService.getForest();
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
