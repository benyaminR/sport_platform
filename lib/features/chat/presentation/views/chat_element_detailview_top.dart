import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../profile_picture_middle.dart';

class ChatElementDetailviewTop extends StatefulWidget {
  ChatElementDetailviewTop();

  _ChatElementDetailviewTopState createState() => _ChatElementDetailviewTopState();
}

class _ChatElementDetailviewTopState extends State<ChatElementDetailviewTop> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 8.0, top: 20.0, bottom: 0.0),
      child: Container(
        child: Row(
          children: [
            ProfilePictureMiddle(),
            SizedBox(
              width: 4.0,
            ),
            Text(
              "@Stella",
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFFFFFFFF),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
