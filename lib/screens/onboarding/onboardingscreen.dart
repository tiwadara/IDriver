import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:instant_driver/screens/onboarding/components/body.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingScreen extends StatelessWidget {
  final SharedPreferences prefs;

  OnboardingScreen({this.prefs});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
