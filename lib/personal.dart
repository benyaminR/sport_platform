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
    return SafeArea(
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              ProfilePicture(url: 'Trainers/face_01.jpg', size: 100.0,),
              SizedBox(
                height: 10,
              ),
              Text(
                '@jacqueline',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
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
                height: 40.0,
                width: 140.0,
                child: Center(
                  child: Text(
                    'Adden',
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              //Container mit Shadow
              Stack(
                children: <Widget>[
                  Center(
                    child: Container(
                      width: 240.0,
                      height: 60.0,
                      decoration: new BoxDecoration(
                        color: Color(0xFF141416),
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
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
                                      color: Color(0xFF707070), fontSize: 16.0),
                                ),
                                Text(
                                  'Followers',
                                  style: TextStyle(
                                      color: Color(0xFF707070), fontSize: 8.0),
                                ),
                              ],
                            ),
                            Text(
                              '|',
                              style:
                              TextStyle(color: Color(0xFF707070), fontSize: 30.0),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '100M',
                                  style: TextStyle(
                                      color: Color(0xFF707070), fontSize: 16.0),
                                ),
                                Text(
                                  'Followed',
                                  style: TextStyle(
                                      color: Color(0xFF707070), fontSize: 8.0),
                                ),
                              ],
                            ),
                            Text(
                              '|',
                              style:
                              TextStyle(color: Color(0xFF707070), fontSize: 30.0),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '100M',
                                  style: TextStyle(
                                      color: Color(0xFF707070), fontSize: 16.0),
                                ),
                                Text(
                                  'Likes',
                                  style: TextStyle(
                                      color: Color(0xFF707070), fontSize: 8.0),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.lerp(Alignment.bottomRight, Alignment.topLeft, 0.2),
                    child: Image(
                      width: 30.0,
                      height: 30.0,
                      image: AssetImage('assets/images/star_personal.png'),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  _bildbeschreibung,
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF707070),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Color(0xFF141416),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 50.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Kurse",
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF707070),
                            ),
                          ),
                          Text(
                            "Posts",
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF707070),
                            ),
                          ),
                          Text(
                            "Liked",
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF707070),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0, top: 16.0),
                      child: PersonalCourseBoxBlack(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0, top: 16.0),
                      child: PersonalCourseBoxBlack(),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
