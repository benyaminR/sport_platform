import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePicture extends StatelessWidget {

  final String url;
  final double size;

  ProfilePicture({@required this.url, @required this.size});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(size),
          color: Color(0xFFE4572E),
          boxShadow: [
            BoxShadow(
              color: Color(0xFFE4572E),
              blurRadius: 0.0,
              spreadRadius: 0.5,
            ),
          ],
        ),
        child: CircleAvatar(
          backgroundImage: NetworkImage(url),
          //20.0
          radius: size,
        ),
      ),
    );
  }
}
