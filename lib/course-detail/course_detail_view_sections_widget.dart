import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_platform/course-detail/course_detail_view_sections_widget_element.dart';
import 'package:sport_platform/features/courses/domain/enitity/content_section.dart';
import 'package:sport_platform/features/courses/domain/enitity/video.dart';
import 'package:sport_platform/features/courses/presentation/bloc/courses/courses_bloc.dart';

class CourseDetailViewSectionsWidget extends StatelessWidget {

  const CourseDetailViewSectionsWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoursesBloc,CoursesState>(builder:(context, state) {
      if(state is LoadingCoursesState)
        return CircularProgressIndicator();
      if(state is ErrorCoursesState)
        return Text(state.msg);
      if(state is LoadedCourseState)
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
                  children: List.generate(state.course.content.length, (index) =>
                      CourseDetailViewSectionsWidgetElement(
                        contentSection: state.course.content[index],
                        index: index,)
                  ),
                ),
              ),
            ),
          ),
        );

      return Container();
    }, );
  }
}
