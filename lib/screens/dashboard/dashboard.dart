import 'package:flutter/material.dart';
import 'package:instant_driver/screens/dashboard/components/body.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
      ),
      body: Body(),
    );
  }
}
