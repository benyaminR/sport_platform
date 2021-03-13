import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sport_platform/personal_course_box_black.dart';

import 'utils/components/profile_picture.dart';

class Personal extends StatefulWidget {
  Personal();

  _PersonalState createState() => _PersonalState();
}

class _PersonalState extends State<Personal> {
  final String _bildbeschreibung =
      "Danke für die Erinnerung, hatte die Woche keine Zeit mich bei dir zu melden. Aber wir können gerne die Themen besprechen. Glaube, dass Tim keine Infos vom letzten Meeting bekommen hat";

  @override
  Widget build(BuildContext context) {
    // Full screen width and height
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    // Height (without SafeArea)
    final padding = MediaQuery.of(context).padding;
    final double height1 = height - padding.top - padding.bottom;
    // Height (without status bar)
    final double height2 = height - padding.top;
    // Height (without status and toolbar)
    final double height3 = height - padding.top - kToolbarHeight;

    return SafeArea(
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: height3 * 0.04,
              ),
              ProfilePicture(
                url: 'Trainers/face_01.jpg',
                size: height3 * 0.15,
              ),
              SizedBox(
                height: height3 * 0.02,
              ),
              Text(
                '@jacqueline',
                style: TextStyle(
                  color: Colors.white,
                  // fontSize: 20,
                  fontSize: height3 * 0.03,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                // height: 20,
                height: height3 * 0.03,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18.0),
                  color: Color(0xFFE4572E),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFFE4572E).withAlpha(60),
                      blurRadius: 8.0,
                      spreadRadius: 4.0,
                    ),
                  ],
                ),
                height: height3 * 0.06,
                width: height3 * 0.21,
                child: Center(
                  child: Text(
                    'Adden',
                    style: TextStyle(color: Colors.white, fontSize: height3 * 0.03),
                  ),
                ),
              ),
              SizedBox(
                height: height3 * 0.03,
              ),
              //Container mit Shadow
              Stack(
                children: <Widget>[
                  Center(
                    child: Container(
                      width: height3 * 0.36,
                      height: height3 * 0.09,
                      decoration: new BoxDecoration(
                        color: Color(0xFF141416),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 26.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '100M',
                                  style: TextStyle(
                                      color: Color(0xFF707070), fontSize: height3 * 0.024),
                                ),
                                Text(
                                  'Followers',
                                  style: TextStyle(
                                      color: Color(0xFF707070), fontSize: height3 * 0.012),
                                ),
                              ],
                            ),
                            Text(
                              '|',
                              style: TextStyle(
                                  color: Color(0xFF707070), fontSize: height3 * 0.045),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '100M',
                                  style: TextStyle(
                                      color: Color(0xFF707070), fontSize: height3 * 0.024),
                                ),
                                Text(
                                  'Followed',
                                  style: TextStyle(
                                      color: Color(0xFF707070), fontSize: height3 * 0.012),
                                ),
                              ],
                            ),
                            Text(
                              '|',
                              style: TextStyle(
                                  color: Color(0xFF707070), fontSize: height3 * 0.045),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '100M',
                                  style: TextStyle(
                                      color: Color(0xFF707070), fontSize: height3 * 0.024),
                                ),
                                Text(
                                  'Likes',
                                  style: TextStyle(
                                      color: Color(0xFF707070), fontSize: height3 * 0.012),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.lerp(
                        Alignment.bottomRight, Alignment.topLeft, 0.2),
                    child: Image(
                      width: height3 * 0.045,
                      height: height3 * 0.045,
                      image: AssetImage('assets/images/star_personal.png'),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height3 * 0.03,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  _bildbeschreibung,
                  style: TextStyle(
                    fontSize: height3 * 0.022,
                    color: Color(0xFF707070),
                  ),
                ),
              ),
              SizedBox(
                height: height3 * 0.03,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xFF141416),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 50.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Kurse",
                            style: TextStyle(
                              fontSize: height3 * 0.022,
                              color: Color(0xFF707070),
                            ),
                          ),
                          Text(
                            "Posts",
                            style: TextStyle(
                              fontSize: height3 * 0.022,
                              color: Color(0xFF707070),
                            ),
                          ),
                          Text(
                            "Liked",
                            style: TextStyle(
                              fontSize: height3 * 0.022,
                              color: Color(0xFF707070),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 8.0, right: 8.0, bottom: 8.0, top: 16.0),
                      child: PersonalCourseBoxBlack(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 8.0, right: 8.0, bottom: 8.0, top: 16.0),
                      child: PersonalCourseBoxBlack(),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height3 * 0.06,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
