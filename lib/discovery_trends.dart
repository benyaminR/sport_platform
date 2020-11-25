import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'container.dart';
import 'features/courses/presentation/bloc/courses/courses_bloc.dart';
import 'image_section.dart';

class DiscoveryTrends extends StatefulWidget {
  @override
  _DiscoveryTrendsState createState() => _DiscoveryTrendsState();
}

class _DiscoveryTrendsState extends State<DiscoveryTrends> {

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black,
      elevation: 14.0,
      shadowColor: Color(000000),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 16.0, top: 15.0, right: 16.0, bottom: 8.0),
            child: Container(
              height: 30.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Im Trend",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0),
                  ),
                  Text(
                    'Mehr',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(0.0),
            child: BlocProvider(
              create: (context) =>
              getIt<CoursesBloc>()
                ..add(GetCoursesEvent(criteriaData: null)),
              child: BlocBuilder<CoursesBloc, CoursesState>(
                builder: (context, state) {
                  if (state is LoadingCoursesState) {
                    Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is LoadedCoursesState) {
                    return Container(
                      height: 160.0,
                      child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: List.generate(
                            state.courses.length,
                                (index) => ImageSection(),
                          )),
                    );
                  }

                  return Container();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}