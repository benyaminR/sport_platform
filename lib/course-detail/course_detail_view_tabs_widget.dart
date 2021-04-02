import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sport_platform/container.dart';

import 'course_detail_view_tabs/course_detail_view_tabs_bloc.dart';

class CourseDetailViewTabsWidget extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final padding = MediaQuery.of(context).padding;
    final double height3 = height - padding.top - kToolbarHeight;

    return Container(
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
                FlatButton(
                  onPressed: () => getIt<CourseDetailViewTabsBloc>().add(ContentTab()),
                  child: Text(
                    "Kursinhalt",
                    style: TextStyle(
                      fontSize: height3 * 0.022,
                      color: Color(0xFF707070),
                    ),
                  ),
                ),
                FlatButton(
                  onPressed: () => getIt<CourseDetailViewTabsBloc>().add(DescriptionTab()),

                  child: Text(
                    "Beschreibung",
                    style: TextStyle(
                      fontSize: height3 * 0.022,
                      color: Color(0xFF707070),
                    ),
                  ),
                ),
                FlatButton(
                  onPressed: () => getIt<CourseDetailViewTabsBloc>().add(ReviewsTab()),
                  child: Text(
                    "Reviews",
                    style: TextStyle(
                      fontSize: height3 * 0.022,
                      color: Color(0xFF707070),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}
