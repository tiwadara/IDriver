import 'package:flutter/material.dart';
import 'package:instant_driver/screens/dashboard/dashboard.dart';
import 'package:instant_driver/screens/onboarding/onboarding.dart';
import 'package:instant_driver/screens/preferences/preferences.dart';
import 'package:instant_driver/screens/signup/signup.dart';
import 'package:instant_driver/screens/uploads/uploads.dart';
import 'package:instant_driver/theme/style.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  SharedPreferences.getInstance().then((prefs) {
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
        '/onboard': (BuildContext context) => new OnboardingScreen(),
        '/dashboard': (BuildContext context) => new Dashboard(),
        '/signup': (BuildContext context) => new SignUp(),
        '/uploads': (BuildContext context) => new Uploads(),
        '/prefs': (BuildContext context) => new Preferences()
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
      return new OnboardingScreen(prefs: prefs);
    }
  }
}
