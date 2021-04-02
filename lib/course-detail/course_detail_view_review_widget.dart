
import 'package:flutter/material.dart';
import 'package:sport_platform/features/courses/domain/enitity/comment.dart';
import 'package:sport_platform/utils/components/profile_picture.dart';

class CourseDetailViewReviewWidget extends StatelessWidget {

  final Comment comment;
  const CourseDetailViewReviewWidget({Key key,@required this.comment}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    final double height = MediaQuery.of(context).size.height;
    final padding = MediaQuery.of(context).padding;
    final double height3 = height - padding.top - kToolbarHeight;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.black,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
                top: 8.0, left: 8.0, right: 8.0, bottom: 0.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ProfilePicture(
                  url: 'Users/face_00.jpg',
                  size: 20.0,
                ),
                SizedBox(
                  width: height3 * 0.015,
                ),
                Text(
                  "Elli",
                  style: TextStyle(
                    fontSize: height3 * 0.022,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: height3 * 0.28,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      size: height3 * 0.031,
                      color: Colors.white,
                    ),
                    Icon(
                      Icons.star,
                      size: height3 * 0.031,
                      color: Colors.white,
                    ),
                    Icon(
                      Icons.star,
                      size: height3 * 0.031,
                      color: Colors.white,
                    ),
                    Icon(
                      Icons.star,
                      size: height3 * 0.031,
                      color: Colors.white,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 8.0, left: 16.0, right: 16.0, bottom: 16.0),
            child: Text(
              comment.text,
              style: TextStyle(
                fontSize: height3 * 0.022,
                color: Color(0xFF707070),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
