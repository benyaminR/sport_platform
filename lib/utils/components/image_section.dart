import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageSection extends StatefulWidget {
  @override
  _ImageSectionState createState() => _ImageSectionState();
}

class _ImageSectionState extends State<ImageSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 0.0, right: 20.0),
          child: Container(
            height: 100.0,
            width: 200.0,
            decoration: new BoxDecoration(
              image: DecorationImage(
                image: new NetworkImage(
                    "https://www.wochenblatt.de/media/2020/06/07/42199020-l_202006070945_full.jpg"),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Row(
          children: <Widget>[
            Text(
              // state.courses[index].title,
              "Fußball ",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0),
            ),
            Text(
              // state.courses[index].comments[0].stars.toString() + "'★'",
              "4.7 ★",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            // Icon(FontAwesomeIcons.solidStar, size: 10.0,),
          ],
        )
      ],
    );
  }
}
