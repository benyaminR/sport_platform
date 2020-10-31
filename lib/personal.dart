import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'community.dart';

class Personal extends StatefulWidget {
  final Widget child;

  Personal({Key key, this.child}) : super(key: key);

  _PersonalState createState() => _PersonalState();
}

class _PersonalState extends State<Personal> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black,
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            SizedBox(
              height: 10.0,
            ),
            profileInfoBox(),
            SizedBox(
              height: 10.0,
            ),
            challengesTab(),
            SizedBox(
              height: 10.0,
            ),
            myCoursesTab(),
            SizedBox(
              height: 20.0,
            ),
            settingsTab(),
            SizedBox(
              height: 20.0,
            ),
            measurementTab(),
            SizedBox(
              height: 20.0,
            ),
            goalsTab(),
          ],
        ),
    );
  }

  Widget profileInfoBox() {
    return Material(
      color: Colors.black,
      elevation: 14.0,
      shadowColor: Color(000000),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(0.0),
            child: profileInfoFill(),
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: labelContainer("Chris"),
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: labelContainer("Berlin, Deutschland"),
          ),
        ],
      ),
    );
  }

  Widget profileInfoFill() {
    return Container(
      height: 160.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          imageSection2(
              'https://www.wochenblatt.de/media/2020/06/07/42199020-l_202006070945_full.jpg',
              'Chris'),
          SizedBox(
            width: 20.0,
          ),
        ],
      ),
    );
  }

  Widget challengesTab() {
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: Material(
        color: Colors.grey,
        elevation: 14.0,
        shadowColor: Color(000000),
        borderRadius: BorderRadius.circular(20.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(15.0),
              child: labelContainer("Challenges"),
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: labelContainer("1"),
            ),
          ],
        ),
      ),
    );
  }

  Widget myCoursesTab() {
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: Material(
        color: Colors.grey,
        elevation: 14.0,
        shadowColor: Color(000000),
        borderRadius: BorderRadius.circular(20.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(15.0),
              child: labelContainer("Meine Kurse"),
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: labelContainer("2"),
            ),
          ],
        ),
      ),
    );
  }

  Widget settingsTab() {
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: Material(
        color: Colors.grey,
        elevation: 14.0,
        shadowColor: Color(000000),
        borderRadius: BorderRadius.circular(20.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(15.0),
              child: labelContainer("Settings"),
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: labelContainer("1"),
            ),
          ],
        ),
      ),
    );
  }

  Widget measurementTab() {
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: Material(
        color: Colors.grey,
        elevation: 14.0,
        shadowColor: Color(000000),
        borderRadius: BorderRadius.circular(20.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(15.0),
              child: labelContainer("Messwerte"),
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: labelContainer("3"),
            ),
          ],
        ),
      ),
    );
  }

  Widget goalsTab() {
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: Material(
        color: Colors.grey,
        elevation: 14.0,
        shadowColor: Color(000000),
        borderRadius: BorderRadius.circular(20.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(15.0),
              child: labelContainer("Ziele"),
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: labelContainer("2"),
            ),
          ],
        ),
      ),
    );
  }

  Widget labelContainer(String labelVal) {
    return Container(
      height: 30.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            labelVal,
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
    );
  }

  Widget imageSection2(String imageVal, String appVal) {
    return Column(
      children: <Widget>[
        Container(
          height: 100.0,
          width: 160.0,
          decoration: new BoxDecoration(
            image: DecorationImage(
              image: new NetworkImage(imageVal),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          appVal,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16.0),
        ),
      ],
    );
  }
}