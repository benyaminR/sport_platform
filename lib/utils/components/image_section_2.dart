import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageSection2 extends StatefulWidget {
  @override
  _ImageSection2State createState() => _ImageSection2State();
}

class _ImageSection2State extends State<ImageSection2> {
  final String imageVal = "https://www.wochenblatt.de/media/2020/06/07/42199020-l_202006070945_full.jpg";

  @override
  Widget build(BuildContext context) {
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
          // state.courses[index].title,
          "Fußball",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16.0),
        ),
      ],
    );
  }
}
