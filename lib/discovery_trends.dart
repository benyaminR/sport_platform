import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'container.dart';
import 'features/courses/presentation/bloc/courses/courses_bloc.dart';
import 'utils/components/image_section.dart';


class DiscoveryTrends extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
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
                  left: 16.0, top: 16.0, right: 16.0, bottom: 8.0),
              child: Container(
                height: 30.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Im Trend",
                      style: TextStyle(
                          color: Colors.white,
                          // fontWeight: FontWeight.bold,
                          fontSize: 20.0),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18.0),
                        color: Colors.black,
                      ),
                      height: 18.0,
                      width: 56.0,
                      child: Center(
                        child: Text(
                          'Mehr',
                          style:
                              TextStyle(color: Colors.white, fontSize: 14.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 0.0, top: 0.0, bottom: 16.0, right: 0.0),
              child: BlocProvider(
                create: (context) => getIt<CoursesBloc>()
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
                        height: 120.0,
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
      ),
    );
  }
}
