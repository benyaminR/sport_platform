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
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Color(0xFF141416),
      ),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
            child: Container(
              child: Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: (MediaQuery.of(context).size.height) - 380,
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
                    padding: EdgeInsets.only(top: 220.0, left: 16.0, right: 16.0),
                    child: Text(
                      _bildbeschreibung,
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xFF707070),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: 190.0, left: 16.0, right: 16.0),
                    child: Container(
                      height: 30.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Fitness Class",
                            style: TextStyle(
                                color: Colors.white,
                                // fontWeight: FontWeight.bold,
                                fontSize: 20.0),
                          ),
                          SizedBox(
                            width: 80,
                          ),
                          Icon(Icons.person, size: 14.0, color: Color(0xFF707070)),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            '1,000,000',
                            style: TextStyle(
                                color: Color(0xFF707070),
                                // fontWeight: FontWeight.bold,
                                fontSize: 12.0),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Icon(Icons.star, size: 14.0, color: Colors.white),
                          Icon(Icons.star, size: 14.0, color: Colors.white),
                          Icon(Icons.star, size: 14.0, color: Colors.white),
                          Icon(Icons.star, size: 14.0, color: Colors.white),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: (MediaQuery.of(context).size.height) - 500,
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
      ),
    );
  }
}
