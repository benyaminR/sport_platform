import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sport_platform/discovery_continue.dart';
import 'package:sport_platform/discovery_trainers.dart';
import 'package:sport_platform/discovery_trainers2.dart';

import 'discovery_categories.dart';
import 'discovery_courses.dart';
import 'discovery_trends.dart';

//Startseite
class Discovery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          SizedBox(
            height: 10.0,
          ),
          DiscoveryTrends(),
          Row(
            children: [
              DiscoveryTrainers2(),
            ],
          ),
          DiscoveryCourses(),
          SizedBox(
            height: 10.0,
          ),
          DiscoveryContinue(),
          SizedBox(
            height: 20.0,
          ),
          DiscoveryCategories(),
          SizedBox(
            height: 20.0,
          ),
          // DiscoveryContinue(),
        ],
      ),
    );
  }
}
