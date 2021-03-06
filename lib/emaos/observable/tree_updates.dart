import 'package:flutter/foundation.dart';

class TreeUpdateListObservable {
  List<TreeUpdateO> list;

  TreeUpdateListObservable({
    this.list = const [],
  });
}

class TreeUpdateO {
  final String treeName;
  final String treeId;
  final String updateMessage;
  final TreeUpdateType type;

  const TreeUpdateO({
    @required this.treeName,
    @required this.treeId,
    @required this.updateMessage,
    @required this.type,
  });
}

enum TreeUpdateType {
  newPhoto,
  newMessage,
}
