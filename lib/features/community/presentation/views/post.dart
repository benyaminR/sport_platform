import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../../../../profile_picture_middle.dart';
import 'file:///C:/Users/chris/Documents/SourceCode/sport_platform/lib/features/community/presentation/views/post_elements.dart';

class Post extends StatefulWidget {
  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height - 130;
    return Container(
      child: Stack(
        children: <Widget>[
          Padding(
            padding:
                EdgeInsets.only(left: 0.0, right: 0.0, bottom: 0.0, top: 80.0),
            child: Container(
              child: CarouselSlider(
                options: CarouselOptions(
                  height: height,
                  viewportFraction: 1.0,
                  enlargeCenterPage: false,
                  autoPlay: false,
                  enableInfiniteScroll: false,
                  scrollDirection: Axis.vertical,
                ),
                items: <Widget>[
                  PostElements(),
                  PostElements(),
                  PostElements(),
                ],
              ),
            ),
          ),
          Padding(
            padding:
                EdgeInsets.only(left: 8.0, right: 8.0, top: 20.0, bottom: 0.0),
            child: Container(
              height: 50.0,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: <Widget>[
                    ProfilePictureMiddle(),
                    ProfilePictureMiddle(),
                    ProfilePictureMiddle(),
                    ProfilePictureMiddle(),
                    ProfilePictureMiddle(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
