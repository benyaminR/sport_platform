import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sport_platform/utils/components/profile_picture_middle.dart';

class ChatElementDetailviewLeft extends StatefulWidget {
  ChatElementDetailviewLeft();

  _ChatElementDetailviewLeftState createState() => _ChatElementDetailviewLeftState();
}

class _ChatElementDetailviewLeftState extends State<ChatElementDetailviewLeft> {
  final String _bildbeschreibung = "Danke für die Erinnerung, hatte die Woche keine Zeit mich bei dir zu melden. Aber wir können gerne die Themen besprechen. Glaube, dass Tim keine Infos vom letzten Meeting bekommen hat";

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black,
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfilePictureMiddle(url: 'https://schoenheitsmerkmale.de/wp-content/uploads/2018/02/schoene-frau-300x300.jpg'),
            SizedBox(
              width: 10.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width - 150,
                  color: Colors.black,
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width - 150,
                        decoration: new BoxDecoration(
                          color: Color(0xFFED2644),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.zero,
                              topRight: Radius.circular(10.0),
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
                    '16:30',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF707070),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
