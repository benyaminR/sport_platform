import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sport_platform/utils/components/profile_picture.dart';

import 'utils/components/image_section.dart';

class DiscoveryTrainers2 extends StatefulWidget {
  @override
  _DiscoveryTrainers2State createState() => _DiscoveryTrainers2State();
}

class _DiscoveryTrainers2State extends State<DiscoveryTrainers2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Color(0xFF141416),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: EdgeInsets.only(left: 16.0, top: 16.0, bottom: 8.0, right: 16.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                    left: 0.0, top: 0.0, right: 0.0, bottom: 8.0),
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
                            // fontWeight: FontWeight.bold,
                            fontSize: 20.0),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18.0),
                          color: Colors.black,
                        ),
                        height: 18.0,
                        width: 56.0,
                        child: Center(
                          child: Text(
                            'Mehr',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              Container(
                height: 80.0,
                width: MediaQuery.of(context).size.width,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ProfilePicture(url: 'https://i.pinimg.com/736x/38/1d/71/381d71e601a0b84411bc242e571288c2.jpg', size: 30.0,),
                        SizedBox(
                          height: 4.0,
                        ),
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
        ),
      ),
    );
  }
}
