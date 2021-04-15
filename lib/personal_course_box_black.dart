import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_platform/container.dart';
import 'package:sport_platform/course-detail/course_detail_view.dart';
import 'package:sport_platform/features/storage/presentation/storage/storage_bloc.dart';
import 'features/courses/domain/enitity/course.dart';

class PersonalCourseBoxBlack extends StatelessWidget {
  final Course course;

  const PersonalCourseBoxBlack({Key key, @required this.course})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Full screen width and height
    final double height = MediaQuery.of(context).size.height;
    // Height (without SafeArea)
    final padding = MediaQuery.of(context).padding;
    final double height3 = height - padding.top - kToolbarHeight;

    return Padding(
      padding:
          const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0, top: 16.0),
      child: GestureDetector(
        onTap: () => Navigator.of(context).pushNamed(
            '/home/personal/courseDetailView',
            arguments: CourseDetailViewData(courseID: course.path)),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 0.0, right: 0.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                // height:
                // (MediaQuery.of(context).size.height) - height3 * 0.52,
                decoration: new BoxDecoration(
                  color: Color(0xFF000000),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                      bottomLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0)),
                ),
                child: Stack(
                  children: [
                    Padding(
                      // padding: EdgeInsets.only(top: 230, left: 16.0, right: 16.0),
                      padding: EdgeInsets.only(
                          top: height3 * 0.34,
                          bottom: height3 * 0.024,
                          left: height3 * 0.024,
                          right: height3 * 0.024),
                      child: Text(
                        course.description,
                        style: TextStyle(
                          fontSize: height3 * 0.019,
                          color: Color(0xFF707070),
                        ),
                      ),
                    ),
                    Padding(
                      // padding: EdgeInsets.only(top: 190.0, left: 16.0, right: 16.0),
                      padding: EdgeInsets.only(
                          top: height3 * 0.28,
                          left: height3 * 0.024,
                          right: height3 * 0.024),
                      child: Container(
                        height: height3 * 0.048,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              course.title,
                              style: TextStyle(
                                  color: Colors.white,
                                  // fontWeight: FontWeight.bold,
                                  fontSize: height3 * 0.03),
                            ),
                            SizedBox(
                              width: height3 * 0.094,
                            ),
                            Row(
                              children: [
                                Icon(Icons.person,
                                    size: height3 * 0.020,
                                    color: Color(0xFF707070)),
                                SizedBox(
                                  width: height3 * 0.008,
                                ),
                                Text(
                                  course.students.length.toString(),
                                  style: TextStyle(
                                      color: Color(0xFF707070),
                                      // fontWeight: FontWeight.bold,
                                      fontSize: height3 * 0.018),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: height3 * 0.044,
                            ),
                            Row(
                              children: [
                                Icon(Icons.star,
                                    size: height3 * 0.020, color: Colors.white),
                                Icon(Icons.star,
                                    size: height3 * 0.020, color: Colors.white),
                                Icon(Icons.star,
                                    size: height3 * 0.020, color: Colors.white),
                                Icon(Icons.star,
                                    size: height3 * 0.020, color: Colors.white),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    BlocProvider.value(
                      value: getIt<StorageBloc>()
                        ..add(GetDownloadUrlEvent(path: course.thumbnail)),
                      child: BlocBuilder<StorageBloc, StorageState>(
                        builder: (context, state) {
                          if (state is GetDownloadUrlCompleted)
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              height: (MediaQuery.of(context).size.height) -
                                  height3 * 0.82,
                              decoration: new BoxDecoration(
                                image: DecorationImage(
                                  image: new NetworkImage(state.downloadUrl),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20.0),
                                    topRight: Radius.circular(20.0),
                                    bottomLeft: Radius.zero,
                                    bottomRight: Radius.zero),
                              ),
                            );
                          return CircularProgressIndicator();
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
