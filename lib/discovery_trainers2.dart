import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sport_platform/profile_picture_middle_2.dart';

import 'image_section.dart';

class DiscoveryTrainers2 extends StatefulWidget {
  @override
  _DiscoveryTrainers2State createState() => _DiscoveryTrainers2State();
}

class _DiscoveryTrainers2State extends State<DiscoveryTrainers2> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black,
      elevation: 14.0,
      shadowColor: Color(000000),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
                left: 16.0, top: 15.0, right: 16.0, bottom: 8.0),
            child: Container(
              height: 30.0,
              width: MediaQuery.of(context).size.width - 35,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Beliebte Trainer",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0),
                  ),
                  Text(
                    'Mehr',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          Container(
            height: 100.0,
            width: MediaQuery.of(context).size.width,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ProfilePictureMiddle2(),
                    Text(
                      "@jennyfit",
                      style: TextStyle(
                        fontSize: 10,
                        color: Color(0xFF707070),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
