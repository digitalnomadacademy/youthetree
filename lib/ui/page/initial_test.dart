import 'package:flutter/material.dart';
import 'package:youthetree/router/router.dart';

class InitialTestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: routes.keys
            .map((routeName) => Card(
                  child: ListTile(
                    title: Text(routeName),
                    onTap: () => Navigator.pushNamed(context, routeName),
                  ),
                ))
            .toList(),
      ),
    );
  }
}
