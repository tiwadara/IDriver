import 'package:flutter/material.dart';
import 'package:instant_driver/theme/custom_colors.dart';
import 'package:instant_driver/theme/text_style.dart';

ThemeData appTheme() {
  return ThemeData(
      primaryColor: CustomColors.primary,
      primaryColorLight: CustomColors.primary_light,
      accentColor: Colors.orange,
      hintColor: CustomColors.black,
      dividerColor: Colors.white,
      buttonColor: Colors.white,
      scaffoldBackgroundColor: Colors.white,
      canvasColor: CustomColors.primary,
      textTheme: TextTheme(
          subtitle: CustomTextStyle.sub_title,
          title: CustomTextStyle.title
      ));
}
