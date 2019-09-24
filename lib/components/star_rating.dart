import 'package:flutter/material.dart';
import 'package:instant_driver/theme/custom_colors.dart';
import 'package:instant_driver/theme/style.dart';

class StarRating extends StatelessWidget {
  final int value;

  const StarRating({Key key, this.value = 0})
      : assert(value != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        if (index < value) {
          return Icon(
              Icons.star, color: appTheme().primaryColorLight);
        } else {
          return Icon(Icons.star_border, color: CustomColors.warm_grey);
        }
      }
      ),
    );
  }
}
