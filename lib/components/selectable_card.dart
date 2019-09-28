import 'package:flutter/material.dart';
import 'package:instant_driver/theme/custom_colors.dart';

class SelectableCard extends StatefulWidget {
  const SelectableCard({Key key,
    this.icon,
    this.title,
    this.subTitle,
    this.child,
    @required this.height,
    @required this.width})
      : super(key: key);

  final IconData icon;
  final String title;
  final String subTitle;
  final double height;
  final double width;
  final Widget child;

  @override
  _SelectableCardState createState() => _SelectableCardState();
}

class _SelectableCardState extends State<SelectableCard> {
  bool _value = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: CustomColors.warm_grey,
      onTap: () {
        setState(() {
          _value = !_value;
        });
      },
      child: new Card(
          elevation: 2,
          shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(15.0)),
          child: Container(
            height: widget.height,
            width: widget.width,
            child: Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: CustomColors.primary)),
                      child: _value
                          ? Container(
                        height: 12,
                        width: 12,
                      )
                          : Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: CustomColors.primary),
                        child: Icon(
                          Icons.check,
                          size: 12.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    alignment: Alignment.topRight,
                  ),
                ),
                Positioned.fill(
                  child: (widget.child != null) ? widget.child : Container(
                    height: widget.height, width: widget.width,),
                ),
              ],
            ),
          )),
    );
  }
}
