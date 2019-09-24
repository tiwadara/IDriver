import 'package:flutter/widgets.dart';

class NavigationMenu {
  IconData icon;
  String title;
  String notificationCount;
  Widget extraWidget;
  String route;

  NavigationMenu(
      {this.icon, this.title, this.notificationCount, this.extraWidget, this.route}) {
    if (extraWidget == null) {
      extraWidget = new Container();
    }
  }
}
