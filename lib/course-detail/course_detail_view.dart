import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_platform/container.dart';
import 'package:sport_platform/course-detail/course_detail_view_tabs/course_detail_view_tabs_bloc.dart';
import 'package:sport_platform/features/courses/domain/enitity/course.dart';
import 'package:sport_platform/features/courses/presentation/bloc/courses/courses_bloc.dart';
import 'package:sport_platform/features/storage/presentation/storage/storage_bloc.dart';
import 'package:sport_platform/features/users/domain/usecase/has_purchased_course.dart';
import 'package:sport_platform/features/users/presentation/bloc/users/users_bloc.dart';
import 'package:sport_platform/features/users/presentation/bloc/users_library/users_library_bloc.dart';
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


    return  MultiBlocProvider(
      providers: [
        BlocProvider<CoursesBloc>.value(value: getIt<CoursesBloc>()..add(GetCourseEvent(id: courseID),)),
        BlocProvider<UsersLibraryBloc>.value(value: getIt<UsersLibraryBloc>()..add(HasPurchasedCourseEvent(courseID: courseID),)),
        BlocProvider.value(value: getIt<CourseDetailViewTabsBloc>()..add(ContentTab())),
      ],
      child: BlocBuilder<CoursesBloc, CoursesState>(
        builder: (context, state) {
          print(state);
          if(state is LoadedCourseState)
            return _courseLoaded(height3,state.course, courseID);
          if(state is LoadingCoursesState)
            return CircularProgressIndicator();
          if(state is ErrorCoursesState)
            return Text(state.msg);
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget _courseLoaded(double height3,Course course,String courseID) {
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

                CourseDetailViewTop(trainer: course.trainer),

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

                //button
                BlocBuilder<UsersLibraryBloc,UsersLibraryState>(
                    builder: (context, state) {
                      if(state is LoadingUsersLibraryState)
                        return Center(child: CircularProgressIndicator(),);
                      if(state is HasPurchasedCourseState)
                        if(!state.hasPurchased)
                          return CourseDetailViewStartButtonWidget(course: course);
                      if(state is ErrorUsersLibraryState)
                        return Center(child: Text(state.msg),);
                      return Container();
                    },)
                ,
                SizedBox(
                  height: height3 * 0.015,
                ),

                CourseDetailViewTabsWidget(),
                SizedBox(
                  height: height3 * 0.015,
                )
                ,
            BlocBuilder<CourseDetailViewTabsBloc,CourseDetailViewTabsState>(
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
                SizedBox(
                  height: height3 * 0.015,
                ),
              ],
            ),
          ),
        ));
  }
}

class CourseDetailViewData{
  final String courseID;

  CourseDetailViewData({
    @required this.courseID,
  });
}
