import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:sport_platform/profile_picture_middle.dart';
import 'package:sport_platform/profile_picture_small.dart';

import 'bottom_sheet.dart';
import 'features/community/presentation/views/post_slide.dart';

class DiscoveryContinue extends StatefulWidget {
  @override
  _DiscoveryContinueState createState() => _DiscoveryContinueState();
}

class _DiscoveryContinueState extends State<DiscoveryContinue> {

  final String _bildbeschreibung = "adfafdf";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Color(0xFF141416),
        ),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: (MediaQuery.of(context).size.height) - 100,
          child: Column(
            children: <Widget>[
              SizedBox(
                child: Padding(
                  padding: EdgeInsets.only(left: 8.0, top: 8.0, bottom: 8.0),
                  child: Container(
                    child: Row(
                      children: [
                        ProfilePictureMiddle(),
                        Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Stella",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Color(0xFFFFFFFF),
                                ),
                              ),
                              Text(
                                "Berlin, Deutschland",
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Color(0xFF707070),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                height: 60.0,
              ),
              PostSlide(),
              SizedBox(
                height: 15.0,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20.0,
                  ),
                  GestureDetector(
                    child: Image(
                      image: AssetImage('assets/images/herz.png'),
                      height: 25.0,
                      width: 25.0,
                    ),
                    onTap: () => onButtonPressed(context),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  GestureDetector(
                    child: Image(
                      image: AssetImage('assets/images/kommentar.png'),
                      height: 25.0,
                      width: 25.0,
                    ),
                    onTap: () => onButtonPressed(context),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  GestureDetector(
                    child: Image(
                      image: AssetImage('assets/images/teilen.png'),
                      height: 25.0,
                      width: 25.0,
                    ),
                    onTap: () => onButtonPressed(context),
                  ),
                ],
              ),
              SizedBox(
                height: 15.0,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20.0,
                  ),
                  RowSuper(
                    children: [
                      ProfilePictureSmall(),
                      ProfilePictureSmall(),
                      ProfilePictureSmall(),
                      ProfilePictureSmall(),
                    ],
                    innerDistance: -12.0,
                  ),
                  SizedBox(
                    width: 150,
                  ),
                  Text(
                    "liked by James and 12k more",
                    style: TextStyle(
                      fontSize: 10,
                      color: Color(0xFF707070),
                    ),
                  ),
                ],
              ),
              //Images der Profilbilder(extra Widget -> wird auch für Storys benötigt bei post.dart) überlappend mit Gesture Detector
              SizedBox(
                height: 15.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  _bildbeschreibung,
                  style: TextStyle(
                    fontSize: 15,
                    color: Color(0xFF707070),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}