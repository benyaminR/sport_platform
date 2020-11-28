import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePictureMiddle extends StatelessWidget {

  final String url;

  ProfilePictureMiddle({@required this.url});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.0),
      child: Container(
        child: CircleAvatar(
          backgroundImage: NetworkImage(url),
          radius: 20.0,
        ),
      ),
    );
  }
}
