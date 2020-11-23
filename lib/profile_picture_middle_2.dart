import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePictureMiddle2 extends StatefulWidget {
  ProfilePictureMiddle2();

  _ProfilePictureMiddle2State createState() => _ProfilePictureMiddle2State();
}

class _ProfilePictureMiddle2State extends State<ProfilePictureMiddle2> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.0),
      child: Container(
        child: CircleAvatar(
          backgroundImage: NetworkImage('https://i.pinimg.com/736x/38/1d/71/381d71e601a0b84411bc242e571288c2.jpg'),
          radius: 30.0,
        ),
      ),
    );
  }
}