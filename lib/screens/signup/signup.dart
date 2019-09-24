import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'components/body.dart';

class SignUp extends StatelessWidget {

  static const String routeName = '/signup';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}