import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_platform/features/courses/domain/enitity/course.dart';
import 'package:sport_platform/features/courses/presentation/bloc/courses/courses_bloc.dart';

import '../container.dart';
import 'course_detail_view.dart';

class CourseDetailViewStartButtonWidget extends StatelessWidget {

  final Course course;

  const CourseDetailViewStartButtonWidget({Key key,@required this.course}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Full screen width and height
    final double height = MediaQuery.of(context).size.height;
    // Height (without SafeArea)
    final padding = MediaQuery.of(context).padding;
    final double height3 = height - padding.top - kToolbarHeight;

    return GestureDetector(
          onTap: () => getIt<CoursesBloc>().add(AddCourseToLibraryEvent(course: course)),
          child: Container(
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
            height: height3 * 0.06,
            width: height3 * 0.21,
            child: Center(
              child: Text(
                'Starten',
                style: TextStyle(
                    color: Colors.white, fontSize: height3 * 0.03),
              ),
            ),
          ),
        );
  }
}
