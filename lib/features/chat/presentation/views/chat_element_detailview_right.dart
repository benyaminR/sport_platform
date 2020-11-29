import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sport_platform/utils/components/profile_picture_middle.dart';

class ChatElementDetailviewRight extends StatefulWidget {
  ChatElementDetailviewRight();

  _ChatElementDetailviewRightState createState() => _ChatElementDetailviewRightState();
}

class _ChatElementDetailviewRightState extends State<ChatElementDetailviewRight> {
  final String _bildbeschreibung = "Danke für die Erinnerung, hatte die Woche keine Zeit mich bei dir zu melden. Aber wir können gerne die Themen besprechen. Glaube, dass Tim keine Infos vom letzten Meeting bekommen hat";

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black,
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width - 150,
                  color: Colors.black,
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width - 150,
                        decoration: new BoxDecoration(
                          color: Color(0xFFE4572E),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              topRight: Radius.zero,
                              bottomLeft: Radius.circular(10.0),
                              bottomRight: Radius.circular(10.0)),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text(
                            _bildbeschreibung,
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFFFFFFFF),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    '14:45',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF707070),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 10.0,
            ),
            ProfilePictureMiddle(url: 'https://schoenheitsmerkmale.de/wp-content/uploads/2018/02/schoene-frau-300x300.jpg'),
          ],
        ),
      ),
    );
  }
}
