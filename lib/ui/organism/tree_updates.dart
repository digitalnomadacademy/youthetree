import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youthetree/emaos/observable/tree_updates.dart';
import 'package:youthetree/ui/atom/user_avatar.dart';

class TreeUpdates extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[UserAvatar()],
        ),
        Expanded(
          child: Consumer<TreeUpdateListObservable>(
            builder: (_, treeUpdatesO, __) => ListView.builder(
                itemCount: treeUpdatesO.list.length,
                itemBuilder: (context, index) {
                  TreeUpdateO tree = treeUpdatesO.list[index];
                  return ListTile(
                    title: Text(
                      tree.treeName,
                    ),
                    subtitle: Text(tree.updateMessage),
                    leading: Icon(
                      _getIcon(tree),
                      color: Colors.green,
                    ),
                  );
                }),
          ),
        ),
      ],
    );
  }

  // ignore: missing_return
  IconData _getIcon(TreeUpdateO tree) {
    switch (tree.type) {
      case TreeUpdateType.newPhoto:
        return Icons.photo;
      case TreeUpdateType.newMessage:
        return Icons.message;
      default:
        return Icons.help;
    }
  }
}
