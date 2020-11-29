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
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 0.0, right: 0.0),
          child: Container(
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: (MediaQuery.of(context).size.height) - 380,
                  decoration: new BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(topLeft: Radius.zero, topRight: Radius.zero, bottomLeft: Radius.circular(20.0), bottomRight: Radius.circular(20.0)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(top: 220.0, left: 16.0, right: 16.0),
                    child: Text(
                      _bildbeschreibung,
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xFF707070),
                      ),
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
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0), bottomLeft: Radius.zero, bottomRight: Radius.zero),
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
