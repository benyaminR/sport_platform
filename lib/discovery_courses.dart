import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'image_section.dart';

class DiscoveryCourses extends StatefulWidget {
  @override
  _DiscoveryCoursesState createState() => _DiscoveryCoursesState();
}

class _DiscoveryCoursesState extends State<DiscoveryCourses> {
  final String _bildbeschreibung =
      "Hallo Fitness-Freunde, ich habe heute eine ganz spezielle Übung für euch, welche ich euch natürlich nicht vorenthalten möchte.";

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black,
      elevation: 14.0,
      shadowColor: Color(000000),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Container(
              height: 30.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Deine Kurse",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0),
                  ),
                  Text(
                    'Mehr',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(0.0),
            child: Container(
              height: 160.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  SizedBox(
                    width: 15.0,
                  ),
                  ImageSection(),
                  SizedBox(
                    width: 20.0,
                  ),
                  ImageSection(),
                  SizedBox(
                    width: 20.0,
                  ),
                  ImageSection(),
                  SizedBox(
                    width: 20.0,
                  ),
                  ImageSection(),
                  SizedBox(
                    width: 20.0,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}