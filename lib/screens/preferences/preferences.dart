import 'package:flutter/material.dart';

import 'components/body.dart';

class Preferences extends StatelessWidget {

  static const String routeName = '/prefs';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
