import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sport_platform/utils/components/profile_picture.dart';

class ChatElementOverview extends StatefulWidget {
  ChatElementOverview();

  _ChatElementOverviewState createState() => _ChatElementOverviewState();
}

class _ChatElementOverviewState extends State<ChatElementOverview> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black,
      child: Padding(
        padding: EdgeInsets.only(left: 8.0, top: 0.0, bottom: 0.0),
        child: Container(
          child: GestureDetector(
            child: Row(
              children: [
                ProfilePicture(url: 'https://i.pinimg.com/736x/38/1d/71/381d71e601a0b84411bc242e571288c2.jpg', size: 30.0,),
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "@Stella",
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                      SizedBox(
                        height: 2.0,
                      ),
                      Text(
                        "Hey was machst du denn gerade?",
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF707070),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 100.0,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "16:00",
                        style: TextStyle(
                          fontSize: 10,
                          color: Color(0xFF707070),
                        ),
                      ),
                      SizedBox(
                        height: 4.0,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18.0),
                          color: Color(0xFFED2644),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFFFF0000).withAlpha(60),
                              blurRadius: 6.0,
                              spreadRadius: 6.0,
                            ),
                          ],
                        ),
                        width: 18.0,
                        height: 18.0,
                        child: Center(
                          child: Text(
                            "1",
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
              ],
            ),
            onTap: () => Navigator.of(context).pushNamed('/home/chatDetailview'),
          ),
        ),
      ),
    );
  }
}
