import 'package:flutter/material.dart';
import 'package:sport_platform/course-detail/course_detail_view_sections_widget_element.dart';

class CourseDetailViewSectionsWidget extends StatelessWidget {
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

    const loremIpsum =
        "Ungeöffnet";

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color(0xFF141416),
      ),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 0.0, right: 0.0, bottom: 8.0, top: 8.0),
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color(0xFF141416),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CourseDetailViewSectionsWidgetElement(),
                CourseDetailViewSectionsWidgetElement(),
                CourseDetailViewSectionsWidgetElement(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
