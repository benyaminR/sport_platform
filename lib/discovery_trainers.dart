import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sport_platform/utils/components/profile_picture.dart';

class DiscoveryTrainers extends StatefulWidget {
  @override
  _DiscoveryTrainersState createState() => _DiscoveryTrainersState();
}

class _DiscoveryTrainersState extends State<DiscoveryTrainers> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            height: 30.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Im Trend",
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
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ProfilePicture(url: 'https://i.pinimg.com/736x/38/1d/71/381d71e601a0b84411bc242e571288c2.jpg', size: 30.0,),
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
        ],
      ),
    );
  }
}
