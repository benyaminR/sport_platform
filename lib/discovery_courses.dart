import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'image_section.dart';

class DiscoveryCourses extends StatefulWidget {
  @override
  _DiscoveryCoursesState createState() => _DiscoveryCoursesState();
}

class _DiscoveryCoursesState extends State<DiscoveryCourses> {

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black,
      elevation: 14.0,
      shadowColor: Color(000000),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 16.0, top: 15.0, right: 16.0, bottom: 8.0),
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
                  ImageSection(),
                  ImageSection(),
                  ImageSection(),
                  ImageSection(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}