
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'course_detail_view_review_widget.dart';
import '../features/courses/domain/enitity/comment.dart';

class CourseDetailViewReviewsWidget extends StatelessWidget{

  final List<Comment> comments;
  const CourseDetailViewReviewsWidget({Key key,@required this.comments}) : super(key: key);

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: const EdgeInsets.only(
                      left: 8.0, right: 8.0, bottom: 8.0, top: 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xFF141416),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 0.0, left: 16.0, right: 8.0, bottom: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Bewertung",
                                style: TextStyle(
                                  fontSize: height3 * 0.032,
                                  color: Colors.white,
                                ),
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
                        Column(
                            children:comments.map((element) {
                              return CourseDetailViewReviewWidget(comment: element,);
                            }).toList()
                        )

                      ],
                    ),
                  ))
            ]));
  }
}
