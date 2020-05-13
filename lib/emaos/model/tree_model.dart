import 'package:rxdart/rxdart.dart';
import 'package:youthetree/emaos/observable/tree_updates.dart';
import 'package:youthetree/emaos/service/tree_service.dart';

class TreeModel {
//  DEPENDECIES
  final TreeService _treeService;

//  OBSERVABLES
  BehaviorSubject<TreeUpdateListObservable> treeUpdateListO$ = BehaviorSubject();

//  CONSTRUCTOR
  TreeModel(this._treeService) {
    _init();
  }

// PUBLIC METHODS
  void dispose() {
    treeUpdateListO$.close();
  }

//  PRIVATE METHODS

  void _init() {
    treeUpdateListO$.add(_mockTreeUpdateO);
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
