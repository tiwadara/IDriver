import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        onPressed: () {
//          Navigator.pushNamed(context, "/signin");
        },
        child: Text('Welcome'),
      ),
    );
  }
}
