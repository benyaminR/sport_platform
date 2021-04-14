import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sport_platform/features/discovery/domain/entity/trending_course.dart';
import 'package:sport_platform/utils/components/image_section.dart';


class TrendingCourses extends StatelessWidget{

  final List<TrendingCourse> courses;

  const TrendingCourses({Key key, @required this.courses}) : super(key: key);

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

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Color(0xFF141416),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                  left: height3 * 0.024, top: height3 * 0.024, right: height3 * 0.024, bottom: height3 * 0.012),
              child: Container(
                // height: 30.0,
                height: height3 * 0.045,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Im Trend",
                      style: TextStyle(
                          color: Colors.white,
                          // fontWeight: FontWeight.bold,
                          fontSize: height3 * 0.03),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18.0),
                        color: Colors.black,
                      ),
                      height: height3 * 0.027,
                      width: height3 * 0.084,
                      child: Center(
                        child: Text(
                          'Mehr',
                          style:
                          TextStyle(color: Colors.white, fontSize: height3 * 0.021),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(left: 0.0, top: 0.0, bottom: height3 * 0.024, right: 0.0),
                child: Container(
                  height: height3 * 0.18,
                  child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: List.generate(
                        courses.length,
                            (index) => CourseListViewCard(
                          thumbnail: courses[index].thumbnail,
                          courseID:courses[index].id,
                          name: courses[index].name,
                        ),
                      )),
                )
            ),
          ],
        ),
      ),
    );
  }
}
