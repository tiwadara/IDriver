import 'package:flutter/material.dart';
import "package:flutter_swiper/flutter_swiper.dart";
import 'package:instant_driver/Assets.dart';
import 'package:instant_driver/components/custom_flat_button.dart';
import 'package:instant_driver/models/walkthrough.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Body extends StatefulWidget {
  final SharedPreferences prefs;
  final List<Walkthrough> pages = [
    Walkthrough(
      icon: Icons.developer_mode,
      image: Assets.slide_one,
      title: "Welcome to Instant Driver",
      description: "Click next to get started",
    ),
    Walkthrough(
      icon: Icons.layers,
      image: Assets.slide_two,
      title: "Sign up and Register",
      description: "To enjoy all the amazing benefits",
    ),
    Walkthrough(
      icon: Icons.layers,
      image: Assets.slide_three,
      title: "Find Driving Gigs",
      description: "Take them their destination and get Paid",
    )
  ];

  Body({@required this.prefs});

  @override
  _WalkthroughScreenState createState() => _WalkthroughScreenState();
}

class _WalkthroughScreenState extends State<Body> {
  _removePage(index) {
    setState(() {
      widget.pages.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          child: Swiper.children(
            autoplay: false,
            index: 0,
            loop: false,
            pagination: new SwiperPagination(
              margin: new EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 40.0),
              builder: new DotSwiperPaginationBuilder(
                  color: Colors.grey,
                  activeColor: Colors.green,
                  size: 10,
                  space: 10,
                  activeSize: 15),
            ),
            children: _getPages(),
          ),
        )
      ],
    );
  }

  List<Widget> _getPages() {
    List<Widget> widgets = [];
    for (int i = 0; i < widget.pages.length - 1; i++) {
      Walkthrough page = widget.pages[i];
      widgets.add(slide(page: page));
    }
    widgets.add(Container(
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            Padding(
                padding:
                    const EdgeInsets.only(top: 100.0, right: 40.0, left: 40.0),
                child: Image(
                  image: AssetImage(widget.pages[2].image),
                )),
            Padding(
              padding:
                  const EdgeInsets.only(top: 50.0, right: 15.0, left: 15.0),
              child: Text(
                widget.pages[2].title,
                softWrap: true,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.brown,
                  decoration: TextDecoration.none,
                  fontSize: 24.0,
                  fontWeight: FontWeight.w700,
                  fontFamily: "OpenSans",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                widget.pages[2].description,
                softWrap: true,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.brown,
                  decoration: TextDecoration.none,
                  fontSize: 15.0,
                  fontWeight: FontWeight.w300,
                  fontFamily: "OpenSans",
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 20.0, right: 15.0, left: 15.0),
              child: CustomFlatButton(
                  title: "GET STARTED",
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  textColor: Colors.white,
                  onPressed: () async {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    prefs.setBool('seen', true);
                    Navigator.of(context).pushNamed("/signup");
                  },
                  splashColor: Colors.black12,
                  borderColor: Colors.white,
                  borderWidth: 0,
                  color: Colors.green),
            ),
          ],
        )));
    return widgets;
  }
}

Widget slide({Walkthrough page}) {
  return Container(
    color: Colors.white,
    child: ListView(
      children: <Widget>[
        Padding(
            padding: const EdgeInsets.only(top: 100.0, right: 40.0, left: 40.0),
            child: Image(
              image: AssetImage(page.image),
            )),
        Padding(
          padding: const EdgeInsets.only(top: 50.0, right: 15.0, left: 15.0),
          child: Text(
            page.title,
            softWrap: true,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.brown,
              decoration: TextDecoration.none,
              fontSize: 24.0,
              fontWeight: FontWeight.w700,
              fontFamily: "OpenSans",
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            page.description,
            softWrap: true,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.brown,
              decoration: TextDecoration.none,
              fontSize: 15.0,
              fontWeight: FontWeight.w300,
              fontFamily: "OpenSans",
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: page.extraWidget,
        )
      ],
    ),
  );
}
