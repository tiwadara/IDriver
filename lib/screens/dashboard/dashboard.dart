import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instant_driver/screens/dashboard/components/body.dart';

import 'components/drawer_content.dart';

class Dashboard extends StatelessWidget {

  static const String routeName = '/dashboard';

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      drawer: Drawer(
        child: new DrawerContent(),
        elevation: 20,
      ),
      appBar: new AppBar(
        title: new Text('Page Title'),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.close),
            onPressed: () => Navigator.of(context).pop(null),
          ),

        ],

        leading: Builder(
          builder: (context) => Container(
            child: new IconButton(
              icon: new Icon(Icons.menu),
              onPressed: () => {Scaffold.of(context).openDrawer()},
            ),
          ),
        ),
      ),
      body: Body(),
    );
  }
}


