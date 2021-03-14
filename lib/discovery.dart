import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sport_platform/discovery_trainers.dart';
import 'package:sport_platform/personal_course_box.dart';
import 'discovery_courses.dart';
import 'discovery_trends.dart';

//Startseite
class Discovery extends StatelessWidget {
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
      child: Container(
        color: Colors.black,
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            SizedBox(
              height: height3 * 0.015,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  Icons.search,
                  size: height3 * 0.051,
                  color: Color(0xFF707070),
                ),
              ],
            ),
            SizedBox(
              height: height3 * 0.015,
            ),
            DiscoveryTrends(),
            SizedBox(
              height: height3 * 0.015,
            ),
            DiscoveryTrainers2(),
            SizedBox(
              height: height3 * 0.015,
            ),
            DiscoveryCourses(),
            SizedBox(
              height: height3 * 0.015,
            ),
            PersonalCourseBox(),
            SizedBox(
              height: height3 * 0.015,
            ),
            // DiscoveryContinue(),
          ],
        ),
      ),
    );
  }
}
