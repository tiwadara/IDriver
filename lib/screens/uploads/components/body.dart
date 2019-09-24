import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:instant_driver/components/big_button.dart';
import 'package:instant_driver/components/primary_button.dart';
import 'package:instant_driver/theme/custom_colors.dart';
import 'package:instant_driver/theme/style.dart';
import 'package:instant_driver/theme/text_style.dart';
import 'package:url_launcher/url_launcher.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var scareenWidth = MediaQuery.of(context).size.width;
    final ThemeData themeData = Theme.of(context);
    final TextStyle aboutTextStyle = themeData.textTheme.body2;
    final TextStyle linkStyle =
        appTheme().textTheme.body2.copyWith(color: themeData.accentColor);

    return SafeArea(
      child: Container(
        height: screenHeight,
        color: Colors.white,
        child: SingleChildScrollView(
          padding: EdgeInsets.only(left: 30.0, right: 30.0, top: 40.0),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Uploads',
                    style: appTheme().textTheme.title,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        '20%',
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
                      'Please upload the following items',
                      style: appTheme().textTheme.subtitle,
                    ),
                    Spacer()
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: BigButton(
                    icon: Icons.add_circle_outline,
                    label: 'Select',
                    buttonTitle: 'Driver\'s license',
                    buttonSubTitle:
                        'The file type should be jpg or pdf and not more than 1mb',
                    width: scareenWidth,
                    color: Colors.white,
                    borderColor: CustomColors.warm_grey,
                    onPressed: () {
                      Navigator.of(context).pushNamed("/uploads");
                    }),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: BigButton(
                    icon: Icons.add_circle_outline,
                    label: 'Select',
                    buttonTitle: 'Utility bill receipt',
                    buttonSubTitle:
                        'The file type should be jpg or pdf and not more than 1mb',
                    width: scareenWidth,
                    color: Colors.white,
                    borderColor: CustomColors.warm_grey,
                    onPressed: () {
                      Navigator.of(context).pushNamed("/uploads");
                    }),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: BigButton(
                    icon: Icons.person_outline,
                    label: 'Select',
                    buttonTitle: 'Photo',
                    buttonSubTitle:
                        'The file type should be jpg or png and not more than 2mb',
                    width: scareenWidth,
                    color: Colors.white,
                    borderColor: CustomColors.warm_grey,
                    onPressed: () {
                      Navigator.of(context).pushNamed("/uploads");
                    }),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Flex(direction: Axis.horizontal,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Checkbox(
                      activeColor: CustomColors.primary,
                      checkColor: CustomColors.primary,
                      value: true, onChanged: (bool value) {},
                    ),

                    Flexible(
                      child: RichText(
                        text: TextSpan(
                          children: <TextSpan>[

                            TextSpan(
                              style: aboutTextStyle,
                              text: 'I confirm that I have read and I agree to the ',
                            ),
                            TextSpan(
                              text: 'Terms and Conditions',
                              style: new TextStyle(color: CustomColors.primary),
                              recognizer: new TapGestureRecognizer()
                                ..onTap = () {
                                  launch('https://google.com');
                                },
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: PrimaryButton(
                    label: 'SUBMIT',
                    width: scareenWidth,
                    onPressed: () {
                      Navigator.of(context).pushNamed("/prefs");
                    }),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 50),
                child: FlatButton(
                    textColor: CustomColors.primary_light,
                    child: Text(
                      'Remind Me Later',
                      style: CustomTextStyle.textStyle,
                    ),
//                  width: scareenWidth,
                    onPressed: () {
                      Navigator.of(context).pushNamed("/prefs");
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
