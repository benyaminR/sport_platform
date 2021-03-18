import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_platform/container.dart';
import 'package:sport_platform/features/discovery/presentation/discovery/discovery_bloc.dart';
import 'package:sport_platform/features/users/presentation/bloc/users/users_bloc.dart';
import 'package:sport_platform/personal_course_box.dart';
import 'discovery_courses.dart';
import 'discovery_trainers.dart';
import 'discovery_trends.dart';

//Startseite
class Discovery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
      MultiBlocProvider(providers: [
        BlocProvider.value(value: getIt<DiscoveryBloc>()..add(GetDiscovery())),
        BlocProvider.value(value: getIt<UsersBloc>()..add(GetUsersEvent(criteria: null))),
      ],
      child: DiscoveryBody(context),
    );
  }

  Widget DiscoveryBody(context){
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
            BlocBuilder<DiscoveryBloc,DiscoveryState>(
                builder: (context, state){
                  if(state is LoadingDiscoveryState)
                    return Center(
                      child: CircularProgressIndicator(),);
                  if(state is LoadedDiscoveryState)
                    return DiscoveryTrainers(trainers:state.data.trendingTrainers);
                  if(state is ErrorDiscoveryState)
                    return Center(
                      child: Text("Failed"),
                    );
                  return Container();
                }
            ),
            SizedBox(
              height: height3 * 0.015,
            ),
            BlocBuilder<DiscoveryBloc,DiscoveryState>(
                builder: (context, state){
                  if(state is LoadingDiscoveryState)
                    return Center(
                      child: CircularProgressIndicator(),);
                  if(state is LoadedDiscoveryState)
                    return DiscoveryTrends(courses : state.data.trendingCourses);
                  if(state is ErrorDiscoveryState)
                    return Center(
                      child: Text("Failed"),
                    );
                  return Container();
                }
            ),
            SizedBox(
              height: height3 * 0.015,
            ),
            BlocBuilder<UsersBloc,UsersState>(
                builder: (context, state){
                  if(state is LoadingUsersState)
                    return Center(
                      child: CircularProgressIndicator(),);
                  if(state is LoadedUsersState)
                    return DiscoveryCourses(myCourses:state.users[0].purchasedCourses);
                  if(state is ErrorUsersState)
                    return Center(
                      child: Text("Failed"),
                    );
                  return Container();
                }
            ),
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
