import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'utils/components/image_section.dart';

class DiscoveryCourses extends StatefulWidget {
  @override
  _DiscoveryCoursesState createState() => _DiscoveryCoursesState();
}

class _DiscoveryCoursesState extends State<DiscoveryCourses> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Color(0xFF141416),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding:
              EdgeInsets.only(left: 16.0, top: 16.0, bottom: 16.0, right: 16.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                    left: 0.0, top: 0.0, right: 0.0, bottom: 8.0),
                child: Container(
                  height: 30.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Deine Kurse",
                        style: TextStyle(
                            color: Colors.white,
                            // fontWeight: FontWeight.bold,
                            fontSize: 20.0),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18.0),
                          color: Colors.black,
                        ),
                        height: 18.0,
                        width: 56.0,
                        child: Center(
                          child: Text(
                            'Mehr',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(0.0),
                child: Container(
                  height: 120.0,
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
        ),
      ),
    );
  }
}
