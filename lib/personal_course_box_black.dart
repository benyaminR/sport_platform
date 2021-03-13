import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'utils/components/image_section.dart';

class PersonalCourseBoxBlack extends StatefulWidget {
  @override
  _PersonalCourseBoxBlackState createState() => _PersonalCourseBoxBlackState();
}

class _PersonalCourseBoxBlackState extends State<PersonalCourseBoxBlack> {
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

    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 0.0, right: 0.0),
          child: Container(
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: (MediaQuery.of(context).size.height) - height3 * 0.70,
                  decoration: new BoxDecoration(
                    color: Color(0xFF000000),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                        bottomLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0)),
                  ),
                ),
                Padding(
                  // padding: EdgeInsets.only(top: 230, left: 16.0, right: 16.0),
                  padding: EdgeInsets.only(top: height3 * 0.34, left: height3 * 0.024, right: height3 * 0.024),
                  child: Text(
                    _bildbeschreibung,
                    style: TextStyle(
                      fontSize: height3 * 0.019,
                      color: Color(0xFF707070),
                    ),
                  ),
                ),
                Padding(
                  // padding: EdgeInsets.only(top: 190.0, left: 16.0, right: 16.0),
                  padding: EdgeInsets.only(top: height3 * 0.28, left: height3 * 0.024, right: height3 * 0.024),
                  child: Container(
                    height: height3 * 0.048,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Fitness Class",
                          style: TextStyle(
                              color: Colors.white,
                              // fontWeight: FontWeight.bold,
                              fontSize: height3 * 0.03),
                        ),
                        SizedBox(
                          width: height3 * 0.094,
                        ),
                        Icon(Icons.person,
                            size: height3 * 0.020, color: Color(0xFF707070)),
                        SizedBox(
                          width: height3 * 0.008,
                        ),
                        Text(
                          '1,000,000',
                          style: TextStyle(
                              color: Color(0xFF707070),
                              // fontWeight: FontWeight.bold,
                              fontSize: height3 * 0.018),
                        ),
                        SizedBox(
                          width: height3 * 0.044,
                        ),
                        Icon(Icons.star, size: height3 * 0.020, color: Colors.white),
                        Icon(Icons.star, size: height3 * 0.020, color: Colors.white),
                        Icon(Icons.star, size: height3 * 0.020, color: Colors.white),
                        Icon(Icons.star, size: height3 * 0.020, color: Colors.white),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: (MediaQuery.of(context).size.height) - height3 * 0.75,
                  decoration: new BoxDecoration(
                    image: DecorationImage(
                      image: new NetworkImage(
                          "https://www.wochenblatt.de/media/2020/06/07/42199020-l_202006070945_full.jpg"),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                        bottomLeft: Radius.zero,
                        bottomRight: Radius.zero),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
