import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_platform/container.dart';
import 'package:sport_platform/course-detail/course_detail_view_tabs/course_detail_view_tabs_bloc.dart';
import 'package:sport_platform/features/courses/domain/enitity/course.dart';
import 'package:sport_platform/features/courses/presentation/bloc/courses/courses_bloc.dart';
import 'package:sport_platform/features/storage/presentation/storage/storage_bloc.dart';
import 'course_detail_view_description_widget.dart';
import 'course_detail_view_info_widget.dart';
import 'course_detail_view_start_button_widget.dart';
import 'course_detail_view_top.dart';
import 'package:video_player/video_player.dart';
import '../VideoApp.dart';
import 'course_detail_view_reviews_widget.dart';
import 'course_detail_view_sections_widget.dart';
import 'course_detail_view_tabs_widget.dart';

class CourseDetailView extends StatelessWidget {
  const CourseDetailView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Full screen width and height
    final double height = MediaQuery.of(context).size.height;
    // Height (without SafeArea)
    final padding = MediaQuery.of(context).padding;
    final double height3 = height - padding.top - kToolbarHeight;

    CourseDetailViewData data = ModalRoute.of(context)?.settings?.arguments as CourseDetailViewData;
    var courseID = data.courseID;
    var hasPurchased = data.hasPurchased;

    int _currentIndex = 0;

    return BlocProvider.value(
      value: getIt<CoursesBloc>()
        ..add(
          GetCourseEvent(id: courseID),
        ),
      child: BlocBuilder<CoursesBloc, CoursesState>(
        builder: (context, state) {
          print(state);
          if(state is LoadedCourseState)
            return _courseLoaded(height3,state.course,hasPurchased);
          if(state is LoadingCoursesState)
            return CircularProgressIndicator();
          if(state is ErrorCoursesState)
            return Text(state.msg);
          if(state is AddedCourseToLibraryState) {
            Navigator.of(context).pop();
            Navigator.of(context).pushNamed("/home/personal/courseDetailView",
                arguments: CourseDetailViewData(
                    hasPurchased: true, courseID: state.course.path));
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget _courseLoaded(double height3,Course course, bool hasPurchased) {
    return SafeArea(
    child: Material(
      child: Container(
        color: Colors.black,
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            SizedBox(
              height: height3 * 0.015,
            ),

            CourseDetailViewTop(
              profileImage: course.trainer.thumbnail,
              username: course.trainer.name,
            ),

            SizedBox(
              height: height3 * 0.015,
            ),

            BlocProvider.value(
              value: getIt<StorageBloc>()..add(GetDownloadUrlEvent(path:course.content[0].videos[0].source)),
              child: BlocBuilder<StorageBloc,StorageState>(
                builder: (context, state) {
                  if(state is StorageLoading)
                    return CircularProgressIndicator();
                  if(state is GetDownloadUrlCompleted)
                    return VideoApp(
                      videoPlayerController: VideoPlayerController.network(
                        state.downloadUrl,
                      ),
                      looping: true,
                    );
                  if(state is StorageError)
                    return Text(state.msg);

                  return Container();
                },
              ),),

            SizedBox(
              height: height3 * 0.015,
            ),
            CourseDetailViewInfoWidget(
              duration:"not implemented",
              title:course.title,
              sections: "${course.content.length} Abschnitte",
            ),

            SizedBox(
              height: height3 * 0.015,
            ),

            if(!hasPurchased)
              CourseDetailViewStartButtonWidget(course: course,),

            SizedBox(
              height: height3 * 0.015,
            ),

            CourseDetailViewTabsWidget(),
            SizedBox(
              height: height3 * 0.015,
            )
            ,
            BlocProvider.value(value: getIt<CourseDetailViewTabsBloc>()..add(ContentTab()),
            child: BlocBuilder<CourseDetailViewTabsBloc,CourseDetailViewTabsState>(
              builder: (context, state) {
                if(state is ContentTabState)
                  return CourseDetailViewSectionsWidget();
                if(state is DescriptionTabState)
                  return CourseDetailViewDescriptionWidget(
                      title: "Was werde ich lernen?",
                      description: course.description
                  );
                if(state is ReviewsTabState)
                  return CourseDetailViewReviewsWidget( comments:course.comments );
                return Container();
              },
            ),
            )
            ,
            SizedBox(
              height: height3 * 0.015,
            ),
          ],
        ),
      ),
    );
  }
}

class CourseDetailViewData{
  final String courseID;
  final bool hasPurchased;

  CourseDetailViewData({
    @required this.courseID,
    @required this.hasPurchased
  });
}
