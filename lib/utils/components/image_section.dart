import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageSection extends StatefulWidget {
  @override
  _ImageSectionState createState() => _ImageSectionState();
}

class _ImageSectionState extends State<ImageSection> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 100.0,
      width: 240.0,
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Container(
              height: 120.0,
              // width: 200.0,
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
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                "Fußball ",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  shadows: <Shadow>[
                    Shadow(
                      offset: Offset(1.0, 1.0),
                      blurRadius: 6.0,
                      color: Colors.black,
                    ),
                    Shadow(
                      offset: Offset(1.0, 1.0),
                      blurRadius: 6.0,
                      color: Colors.black,
                    ),
                    Shadow(
                      offset: Offset(1.0, 1.0),
                      blurRadius: 6.0,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
