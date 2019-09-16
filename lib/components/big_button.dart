import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:instant_driver/theme/custom_colors.dart';
import 'package:instant_driver/theme/text_style.dart';

class BigButton extends StatelessWidget {
  const BigButton(
      {Key key,
        @required this.icon,
      @required this.label,
      @required this.buttonTitle,
      @required this.buttonSubTitle,
      @required this.color,
      @required this.borderColor,
      @required this.width,
      @required this.onPressed})
      : super(key: key);

  final double width;
  final VoidCallback onPressed;
  final String label;
  final Color color;
  final Color borderColor;
  final String buttonTitle;
  final String buttonSubTitle;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      borderSide:
          BorderSide(color: borderColor, width: 0.8, style: BorderStyle.solid),
      color: color,
      onPressed: onPressed,
      textColor: Colors.white,
      child: Container(
        height: 110,
        margin: EdgeInsets.all(5),
        width: width,
        child: Flex(
          direction: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Flexible(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 25),
                    child: Text(
                      buttonTitle,
                      style: CustomTextStyle.titleB,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      buttonSubTitle,
                      style: CustomTextStyle.subtitleB,
                    ),
                  )
                ],
              ),
            ),
            Spacer(),
            Flexible(
              flex: 2,
              child: DottedBorder(
                color: CustomColors.warm_grey,
                dashPattern: [8, 4],
                strokeWidth: 0.5,
                borderType: BorderType.Rect,
                child: Container(
                  height: 85,
                  width: 85,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Icon(icon,
                          color: CustomColors.warm_grey, size: 45),
                      Text(
                        label,
                        style: CustomTextStyle.textStyle6,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
