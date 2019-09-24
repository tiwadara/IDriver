import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:instant_driver/components/primary_button.dart';
import 'package:instant_driver/components/selectable_card.dart';
import 'package:instant_driver/theme/custom_colors.dart';
import 'package:instant_driver/theme/style.dart';
import 'package:instant_driver/theme/text_style.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var scareenWidth = MediaQuery.of(context).size.width;

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
                    'Preferences',
                    style: appTheme().textTheme.title,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        '99%',
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
                child: Flex(
                  direction: Axis.horizontal,
                  children: <Widget>[
                    Flexible(
                      child: Text(
                        'Please select below which you prefer. You can select as many as possible',
                        style: appTheme().textTheme.subtitle,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Vehicle Type',
                      style: CustomTextStyle.titleB,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Flex(
                  direction: Axis.horizontal,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Flexible(
                      child: selectVehicleCard(Icons.directions_car),
                    ),
                    Flexible(
                      child: selectVehicleCard(Icons.directions_bus),
                    ),
                    Flexible(
                      child: selectVehicleCard(Icons.directions_transit),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Drive Region',
                      style: CustomTextStyle.titleB,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Flex(
                  direction: Axis.horizontal,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Flexible(
                        child: selectCarRegion(
                            'Intra state',
                            RichText(
                                softWrap: true,
                                text: TextSpan(children: <TextSpan>[
                                  TextSpan(
                                      text: "This involves destinations",
                                      style: CustomTextStyle.subtitleC),
                                  TextSpan(
                                      text: ' within',
                                      style: CustomTextStyle.boldColored),
                                  TextSpan(
                                      text:
                                          " the state. You will not receive requests from outside the state.",
                                      style: CustomTextStyle.subtitleC)
                                ])))),
                    Flexible(
                        child: selectCarRegion(
                            'Inter state',
                            RichText(
                                softWrap: true,
                                text: TextSpan(children: <TextSpan>[
                                  TextSpan(
                                      text: "This involves destinations",
                                      style: CustomTextStyle.subtitleC),
                                  TextSpan(
                                      text: ' outside',
                                      style: CustomTextStyle.boldColored),
                                  TextSpan(
                                      text:
                                          " the state. You will receive requests from outside the state.",
                                      style: CustomTextStyle.subtitleC)
                                ]))))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 80),
                child: PrimaryButton(
                    label: 'SAVE',
                    width: scareenWidth,
                    onPressed: () {
                      Navigator.of(context).pushNamed("/dashboard");
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  SelectableCard selectVehicleCard(IconData icon) {
    return SelectableCard(
      height: 65,
      width: 90,
      child: Align(
        child: Icon(icon, size: 40),
        alignment: Alignment.center,
      ),
    );
  }

  SelectableCard selectCarRegion(title, subtitleWidget) {
    return SelectableCard(
      height: 130,
      width: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 10),
            child: Text(
              title,
              style: CustomTextStyle.titleB,
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
              child: subtitleWidget),
        ],
      ),
    );
  }
}
