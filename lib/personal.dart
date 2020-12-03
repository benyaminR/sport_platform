import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sport_platform/personal_course_box.dart';
import 'package:sport_platform/personal_course_box_black.dart';
import 'file:///C:/Users/chris/Documents/SourceCode/sport_platform/lib/utils/components/profile_picture_large.dart';
import 'package:sport_platform/utils/components/profile_picture_large_2.dart';

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
              ProfilePictureLarge2(),
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
              Image(
                width: 34.0,
                height: 34.0,
                image: AssetImage('assets/images/star_personal.png'),
                ),
              Container(
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
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: PersonalCourseBoxBlack(),
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
