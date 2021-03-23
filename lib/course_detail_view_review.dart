import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sport_platform/utils/components/profile_picture.dart';

import 'utils/components/image_section.dart';

class CourseDetailViewReview extends StatelessWidget {

  final String _bildbeschreibung =
      "Hallo Fitness-Freunde, ich habe heute eine ganz spezielle Übung für euch, welche ich euch natürlich nicht vorenthalten möchte.";

  @override
  Widget build(BuildContext context) {
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

    return Container(
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
          Container(
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
                    _bildbeschreibung,
                    style: TextStyle(
                      fontSize: height3 * 0.022,
                      color: Color(0xFF707070),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
