import 'package:flutter/material.dart';
import 'package:instant_driver/theme/custom_colors.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton(
      {Key key,
        this.icon,
      @required this.label,
      @required this.width,
      @required this.onPressed})
      : super(key: key);

  final double width;
  final VoidCallback onPressed;
  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape:
          ContinuousRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      height: 60,
      color: CustomColors.primary,
      minWidth: width,
      onPressed: onPressed,
      textColor: Colors.white,
      child: new Stack(
        children: <Widget>[
          Align(
            child: Text(
              label,
              style: TextStyle(fontSize: 18),
            ),
            alignment: Alignment.center,
          ),
            Align(
              child: Icon(icon),
              alignment: Alignment.centerRight,
            ),
        ],
      ),
    );
  }
}
