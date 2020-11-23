import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePictureSmall extends StatefulWidget {
  ProfilePictureSmall();

  _ProfilePictureStateSmall createState() => _ProfilePictureStateSmall();
}

class _ProfilePictureStateSmall extends State<ProfilePictureSmall> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.0),
      child: Container(
        child: CircleAvatar(
          backgroundImage: NetworkImage('https://i.pinimg.com/736x/38/1d/71/381d71e601a0b84411bc242e571288c2.jpg'),
          radius: 10.0,
        ),
      ),
    );
  }
}