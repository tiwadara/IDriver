import 'package:flutter/material.dart';
import 'package:instant_driver/components/primary_button.dart';
import 'package:instant_driver/theme/custom_colors.dart';
import 'package:instant_driver/theme/style.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var scareenWidth = MediaQuery.of(context).size.width;

    return Container(
      height: screenHeight,
      color: Colors.white,
      margin: EdgeInsets.only(top: 50),
      child: SingleChildScrollView(
        padding: EdgeInsets.only(left: 30.0, right: 30.0, top: 40.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Sign Up',
                  style: appTheme().textTheme.title,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Text(
                      '0%',
                      style: TextStyle(
                          fontSize: 25, color: CustomColors.primary_light),
                    ),
                    Text(
                      ' completed',
                      style: appTheme().textTheme.subtitle,
                    )
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Row(
                children: <Widget>[
                  Text(
                    'Please provide the following details',
                    style: appTheme().textTheme.subtitle,
                  ),
                  Spacer()
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: TextField(
                    decoration: InputDecoration(
                        labelText: 'First Name'))),
            Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: TextField(
                    decoration: InputDecoration(
                        labelText: 'Last Name'))),
            Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: TextField(
                    decoration: InputDecoration(
                        labelText: 'Date Of Birth',
                        suffixIcon: IconButton(
                            icon: Icon(
                              Icons.date_range,
                              color: CustomColors.primary_light,
                            ),
                            onPressed: () {})))),
            Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: TextField(
                    obscureText: false,
                    decoration: InputDecoration(
                        labelText: 'Phone',
                        suffixIcon: IconButton(
                            icon: Icon(
                              Icons.add,
                              color: CustomColors.primary_light,
                            ),
                            onPressed: () {})))),
            Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                        labelText: 'Email ( optional )' ))),
            Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: TextField(
                    decoration: InputDecoration(
                  labelText: 'Address',
                ))),
            Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Password',
                        suffixIcon: IconButton(
                            icon: Icon(
                              Icons.remove_red_eye,
                              color: CustomColors.primary_light,
                            ),
                            onPressed: () {})
                    ))),
            Padding(
              padding: const EdgeInsets.only(top: 50, bottom: 100),
              child: PrimaryButton(
                icon: Icons.arrow_forward,
                label : 'NEXT',
                  width: scareenWidth,
                  onPressed: () {
                    Navigator.of(context).pushNamed("/uploads");
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
