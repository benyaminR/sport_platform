import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageSection extends StatefulWidget {
  @override
  _ImageSectionState createState() => _ImageSectionState();
}

class _ImageSectionState extends State<ImageSection> {
  @override
  Widget build(BuildContext context) {
    // Full screen width and height
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    // Height (without SafeArea)
    final padding = MediaQuery.of(context).padding;
    final double height1 = height - padding.top - padding.bottom;
    // Height (without status bar)
    final double height2 = height - padding.top;
    // Height (without status and toolbar)
    final double height3 = height - padding.top - kToolbarHeight;

    return SizedBox(
      width: height3 * 0.36,
      child: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: height3 * 0.024),
            child: Container(
              height: height3 * 0.18,
              decoration: new BoxDecoration(
                image: DecorationImage(
                  image: new NetworkImage(
                      "https://www.zdf.de/assets/fussball-cl-spielball-100~1280x720?cb=1607534334614"),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: height3 * 0.012),
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                "Fußball ",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: height3 * 0.024,
                  shadows: <Shadow>[
                    Shadow(
                      offset: Offset(1.0, 1.0),
                      blurRadius: height3 * 0.009,
                      color: Colors.black,
                    ),
                    Shadow(
                      offset: Offset(1.0, 1.0),
                      blurRadius: height3 * 0.009,
                      color: Colors.black,
                    ),
                    Shadow(
                      offset: Offset(1.0, 1.0),
                      blurRadius: height3 * 0.009,
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
