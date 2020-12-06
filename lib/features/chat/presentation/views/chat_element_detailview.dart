import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sport_platform/utils/components/profile_picture.dart';

class ChatElementDetailview extends StatelessWidget {
  final String side;
  final String time;
  final String message;

  ChatElementDetailview({@required this.side, @required this.time, @required this.message});

  // final String _bildbeschreibung =
  //     "Danke für die Erinnerung, hatte die Woche keine Zeit mich bei dir zu melden. Aber wir können gerne die Themen besprechen. Glaube, dass Tim keine Infos vom letzten Meeting bekommen hat";

  @override
  Widget build(BuildContext context) {
    return Container(
      child: side == 'left'
          ? Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProfilePicture(
                  url:
                      'https://schoenheitsmerkmale.de/wp-content/uploads/2018/02/schoene-frau-300x300.jpg',
                  size: 20.0,
                ),
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
                                message,
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
                        time,
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF707070),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )
          : Row(
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
                                message,
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
                        time,
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
                ProfilePicture(
                  url:
                      'https://schoenheitsmerkmale.de/wp-content/uploads/2018/02/schoene-frau-300x300.jpg',
                  size: 20.0,
                ),
              ],
            ),
    );
  }
}
