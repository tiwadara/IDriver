import 'package:flutter/material.dart';
import 'package:instant_driver/screens/example1/examplescreen1.dart';
import 'package:instant_driver/screens/onboarding/onboardingscreen.dart';
import 'package:instant_driver/screens/signup/signup.dart';
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
        '/root': (BuildContext context) => new ExScreen1(),
        '/signup': (BuildContext context) => new SignUp(),
      },
      theme: ThemeData(
        primaryColor: Colors.white,
        primarySwatch: Colors.grey,
      ),
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
