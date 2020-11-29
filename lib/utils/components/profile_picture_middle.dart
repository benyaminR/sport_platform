import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePictureMiddle extends StatelessWidget {

  final String url;
  final double size;

  ProfilePictureMiddle({@required this.url, @required this.size});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.0),
      child: Container(
        child: CircleAvatar(
          backgroundImage: NetworkImage(url),
          //20.0
          radius: size,
        ),
      ),
    );
  }
}
