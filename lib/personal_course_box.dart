import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'utils/components/image_section.dart';

class PersonalCourseBox extends StatefulWidget {
  @override
  _PersonalCourseBoxState createState() => _PersonalCourseBoxState();
}

class _PersonalCourseBoxState extends State<PersonalCourseBox> {
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
        borderRadius: BorderRadius.circular(20.0),
        color: Color(0xFF141416),
      ),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: height3 * 0.024, right: height3 * 0.024, top: height3 * 0.024),
            child: Container(
              child: Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: (MediaQuery.of(context).size.height) - height3 * 0.66,
                    decoration: new BoxDecoration(
                      color: Color(0xFF141416),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                          bottomLeft: Radius.circular(20.0),
                          bottomRight: Radius.circular(20.0)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: height3 * 0.33, left: height3 * 0.012, right: height3 * 0.012),
                    child: Text(
                      _bildbeschreibung,
                      style: TextStyle(
                        fontSize: height3 * 0.018,
                        color: Color(0xFF707070),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: height3 * 0.285, left: height3 * 0.012, right: height3 * 0.012),
                    child: Container(
                      height: height3 * 0.045,
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
                            width: height3 * 0.065,
                          ),
                          Icon(Icons.person, size: height3 * 0.021, color: Color(0xFF707070)),
                          SizedBox(
                            width: height3 * 0.0075,
                          ),
                          Text(
                            '1,000,000',
                            style: TextStyle(
                                color: Color(0xFF707070),
                                // fontWeight: FontWeight.bold,
                                fontSize: height3 * 0.018),
                          ),
                          SizedBox(
                            width: height3 * 0.065,
                          ),
                          Icon(Icons.star, size: height3 * 0.021, color: Colors.white),
                          Icon(Icons.star, size: height3 * 0.021, color: Colors.white),
                          Icon(Icons.star, size: height3 * 0.021, color: Colors.white),
                          Icon(Icons.star, size: height3 * 0.021, color: Colors.white),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: (MediaQuery.of(context).size.height) - height3 * 0.80,
                    decoration: new BoxDecoration(
                      image: DecorationImage(
                        image: new NetworkImage(
                            "https://www.zdf.de/assets/fussball-cl-spielball-100~1280x720?cb=1607534334614"),
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
      ),
    );
  }
}
