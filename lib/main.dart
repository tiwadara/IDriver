import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:instant_driver/routes/Routes.dart';
import 'package:instant_driver/screens/dashboard/dashboard.dart';
import 'package:instant_driver/screens/onboarding/onboarding.dart';
import 'package:instant_driver/screens/preferences/preferences.dart';
import 'package:instant_driver/screens/signup/signup.dart';
import 'package:instant_driver/screens/uploads/uploads.dart';
import 'package:instant_driver/theme/style.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  SharedPreferences.getInstance().then((prefs) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark
        .copyWith(statusBarIconBrightness: Brightness.dark));
    runApp(App(prefs: prefs));
  });
}

class App extends StatelessWidget {
  final SharedPreferences prefs;

  App({this.prefs});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instant Driver',
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        Routes.onboard: (BuildContext context) => new Onboarding(),
        Routes.dashboard: (BuildContext context) => new Dashboard(),
        Routes.signup: (BuildContext context) => new SignUp(),
        Routes.uploads: (BuildContext context) => new Uploads(),
        Routes.prefs: (BuildContext context) => new Preferences()
      },
      theme: appTheme(),
      home: _handleCurrentScreen(),
    );
  }

  Widget _handleCurrentScreen() {
    bool seen = (prefs.getBool('seen') ?? false);
    if (seen) {
      return new SignUp();
    } else {
      return new Onboarding(prefs: prefs);
    }
  }
}
