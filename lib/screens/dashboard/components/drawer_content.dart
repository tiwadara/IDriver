import 'package:flutter/material.dart';
import 'package:instant_driver/components/star_rating.dart';
import 'package:instant_driver/models/navigationmenu.dart';
import 'package:instant_driver/routes/Routes.dart';
import 'package:instant_driver/theme/custom_colors.dart';
import 'package:instant_driver/theme/style.dart';
import 'package:instant_driver/theme/text_style.dart';

class DrawerContent extends StatefulWidget {
  List<NavigationMenu> _menu = [
    NavigationMenu(
      icon: Icons.home,
      title: "Home",
    ),
    NavigationMenu(
        icon: Icons.business_center, title: "Bookings", notificationCount: '6'),
    NavigationMenu(
      icon: Icons.account_balance_wallet,
      title: "My Wallet",
    ),
    NavigationMenu(
      icon: Icons.history,
      title: "History",
    ),
    NavigationMenu(
        icon: Icons.person_add,
        title: "Invite Friends",
        notificationCount: '6'),
    NavigationMenu(
      icon: Icons.settings,
      title: "Settings",
      route: Routes.prefs
    ),
    NavigationMenu(
      icon: Icons.exit_to_app,
      title: "Log Out",
      route: Routes.onboard
    )
  ];

  DrawerContent({
    Key key,
  }) : super(key: key);

  @override
  _DrawerContentState createState() => _DrawerContentState();
}

class _DrawerContentState extends State<DrawerContent> {


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(top: 50.0, bottom: 50),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 30.0, right: 20),
            child: Row(
              children: <Widget>[
                SizedBox(
                  child: ClipOval(
                      child: Image.network(
                    "https://via.placeholder.com/140x100",
                    height: 60,
                    width: 60,
                    fit: BoxFit.cover,
                  )),
                ),
                SizedBox(
                    child: Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Samuel Smith",
                        style: CustomTextStyle.navName,
                      ),
                      StarRating(
                        value: 2,
                      )
                    ],
                  ),
                ))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Divider(thickness: 1, color: CustomColors.dirty_white),
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Text(
                  "Availability Status",
                  style: CustomTextStyle.titleB,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Switch(value: false, onChanged: (i) {}),
              )
            ],
          ),
          Divider(thickness: 1, color: CustomColors.dirty_white),
          Expanded(
            child: ListView(
              scrollDirection: Axis.vertical,
              children: _getMenuItems(),
              padding: EdgeInsets.only(top: 0),
            ),
          )
        ],
      ),
    );
  }

  List<Widget> _getMenuItems() {
    List<Widget> widgets = [];
    for (int i = 0; i < widget._menu.length - 1; i++) {
      NavigationMenu menu = widget._menu[i];
      widgets.add(_buildMenuItem(menu));
    }
    return widgets;
  }

  Widget _buildMenuItem(NavigationMenu menu) {
    String route = menu.route ?? Routes.dashboard;
    return ListTile(
      onTap: () => {
      Navigator.pushReplacementNamed(context, route)
      },
      title: Padding(
        padding: const EdgeInsets.only(left: 20.0, top: 40),
        child: Row(
          children: <Widget>[
            Icon(
              menu.icon,
              color: appTheme().primaryColor,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                menu.title,
                style: CustomTextStyle.navName,
              ),
            ),
            if (menu.notificationCount != null)
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Align(
                        child: Container(
                      width: 20.0,
                      height: 20.0,
                      decoration: new BoxDecoration(
                        color: appTheme().primaryColorLight,
                        shape: BoxShape.circle,
                      ),
                    )),
                    Align(
                      child: Text(
                        menu.notificationCount,
                        style: CustomTextStyle.boldWhite,
                      ),
                    )
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }
}
