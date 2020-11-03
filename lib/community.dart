import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Community extends StatefulWidget {

  Community();

  _CommunityState createState() => _CommunityState();
}

class _CommunityState extends State<Community> {
  int _currentIndex = 0;

  // final tabs = [
  //   Container(),
  //   Container(),
  //   Container(),
  // ];

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
            trendingCoursesBox(),
            SizedBox(
              height: 10.0,
            ),
            yourCoursesBox(),
            SizedBox(
              height: 10.0,
            ),
            challengesBox(),
            SizedBox(
              height: 20.0,
            ),
            categoriesBox(),
          ],
        ),
    );
  }

  Widget trendingCoursesBox() {
    return Material(
      color: Colors.black,
      elevation: 14.0,
      shadowColor: Color(000000),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(15.0),
            child: labelContainer("Im Trend"),
          ),
          Padding(
            padding: EdgeInsets.all(0.0),
            child: trendingCoursesFill(),
          ),
        ],
      ),
    );
  }

  Widget trendingCoursesFill() {
    return Container(
      height: 160.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          imageSection(
              'https://www.wochenblatt.de/media/2020/06/07/42199020-l_202006070945_full.jpg',
              'Fußball',
              '4.5 ★'),
          SizedBox(
            width: 20.0,
          ),
          imageSection('https://s.hs-data.com/picmon/a4/3hfw_9c391B_lo.jpg',
              'Eishockey', '3.9 ★'),
          SizedBox(
            width: 20.0,
          ),
          imageSection(
              'https://www.dtb-tennis.de/var/ezdemo_site/storage/images/media/images/01-tennisprofis/herren/alexander-zverev/zverev-finals-2020/243029-1-ger-DE/Zverev-Finals-2020_i480_3_2.jpg',
              'Tennis',
              '2.7 ★'),
          SizedBox(
            width: 20.0,
          ),
          imageSection(
              'https://www.hamburg-magazin.net/wp-content/uploads/2018/11/golf-clubs-in-hamburg-300x226-300x226.jpg',
              'Golf',
              '3.9 ★'),
          SizedBox(
            width: 20.0,
          ),
        ],
      ),
    );
  }

  Widget yourCoursesBox() {
    return Material(
      color: Colors.black,
      elevation: 14.0,
      shadowColor: Color(000000),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(15.0),
            child: labelContainer("Deine Kurse"),
          ),
          Padding(
            padding: EdgeInsets.all(0.0),
            child: yourCoursesFill(),
          ),
        ],
      ),
    );
  }

  Widget yourCoursesFill() {
    return Container(
      height: 160.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          imageSection(
              'https://www.dtb-tennis.de/var/ezdemo_site/storage/images/media/images/01-tennisprofis/herren/alexander-zverev/zverev-finals-2020/243029-1-ger-DE/Zverev-Finals-2020_i480_3_2.jpg',
              'Tennis',
              '2.7 ★'),
          SizedBox(
            width: 20.0,
          ),
          imageSection(
              'https://www.hamburg-magazin.net/wp-content/uploads/2018/11/golf-clubs-in-hamburg-300x226-300x226.jpg',
              'Golf',
              '3.9 ★'),
          SizedBox(
            width: 20.0,
          ),
          imageSection(
              'https://www.wochenblatt.de/media/2020/06/07/42199020-l_202006070945_full.jpg',
              'Fußball',
              '4.5 ★'),
          SizedBox(
            width: 20.0,
          ),
          imageSection('https://s.hs-data.com/picmon/a4/3hfw_9c391B_lo.jpg',
              'Eishockey', '3.9 ★'),
          SizedBox(
            width: 20.0,
          ),
        ],
      ),
    );
  }

  Widget challengesBox() {
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
              child: challengesFill(),
            ),
          ],
        ),
      ),
    );
  }

  Widget challengesFill() {
    return Container(
      height: 160.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          imageSection(
              'https://www.dtb-tennis.de/var/ezdemo_site/storage/images/media/images/01-tennisprofis/herren/alexander-zverev/zverev-finals-2020/243029-1-ger-DE/Zverev-Finals-2020_i480_3_2.jpg',
              'Tennis',
              '2.7 ★'),
          SizedBox(
            width: 20.0,
          ),
          imageSection(
              'https://www.hamburg-magazin.net/wp-content/uploads/2018/11/golf-clubs-in-hamburg-300x226-300x226.jpg',
              'Golf',
              '3.9 ★'),
          SizedBox(
            width: 20.0,
          ),
          imageSection(
              'https://www.wochenblatt.de/media/2020/06/07/42199020-l_202006070945_full.jpg',
              'Fußball',
              '4.5 ★'),
          SizedBox(
            width: 20.0,
          ),
          imageSection('https://s.hs-data.com/picmon/a4/3hfw_9c391B_lo.jpg',
              'Eishockey', '3.9 ★'),
          SizedBox(
            width: 20.0,
          ),
        ],
      ),
    );
  }

  Widget categoriesBox() {
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
              child: labelContainer("Categories"),
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: categoriesFill(),
            ),
          ],
        ),
      ),
    );
  }

  Widget categoriesFill() {
    return Container(
      height: 160.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          imageSection2(
              'https://www.dtb-tennis.de/var/ezdemo_site/storage/images/media/images/01-tennisprofis/herren/alexander-zverev/zverev-finals-2020/243029-1-ger-DE/Zverev-Finals-2020_i480_3_2.jpg',
              'Tennis'),
          SizedBox(
            width: 20.0,
          ),
          imageSection2(
              'https://www.hamburg-magazin.net/wp-content/uploads/2018/11/golf-clubs-in-hamburg-300x226-300x226.jpg',
              'Golf'),
          SizedBox(
            width: 20.0,
          ),
          imageSection2(
              'https://www.wochenblatt.de/media/2020/06/07/42199020-l_202006070945_full.jpg',
              'Fußball'),
          SizedBox(
            width: 20.0,
          ),
          imageSection2('https://s.hs-data.com/picmon/a4/3hfw_9c391B_lo.jpg',
              'Eishockey'),
          SizedBox(
            width: 20.0,
          ),
        ],
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

  Widget imageSection(String imageVal, String appVal, String rateVal) {
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
        SizedBox(
          height: 10.0,
        ),
        Row(
          children: <Widget>[
            Text(
              rateVal,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            // Icon(FontAwesomeIcons.solidStar, size: 10.0,),
          ],
        )
      ],
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
