import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageSection3 extends StatefulWidget {
  @override
  _ImageSection3State createState() => _ImageSection3State();
}

class _ImageSection3State extends State<ImageSection3> {
  final String imageVal =
      "https://www.wochenblatt.de/media/2020/06/07/42199020-l_202006070945_full.jpg";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 160.0,
          width: 160.0,
          decoration: new BoxDecoration(
            image: DecorationImage(
              image: new NetworkImage(imageVal),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ],
    );
  }
}
