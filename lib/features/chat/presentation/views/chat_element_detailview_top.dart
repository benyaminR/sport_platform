import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sport_platform/utils/components/profile_picture_middle.dart';


class ChatElementDetailviewTop extends StatefulWidget {
  ChatElementDetailviewTop();

  _ChatElementDetailviewTopState createState() =>
      _ChatElementDetailviewTopState();
}

class _ChatElementDetailviewTopState extends State<ChatElementDetailviewTop> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: EdgeInsets.only(left: 8.0, top: 20.0, bottom: 0.0),
        child: Container(
          child: Row(
            children: [
              GestureDetector(
                child: Icon(
                  Icons.arrow_back,
                  size: 28,
                  color: Colors.white,
                ),
                onTap: () => {
                  Navigator.of(context).pop(),
                },
              ),
              ProfilePictureMiddle(
                url:
                    'https://schoenheitsmerkmale.de/wp-content/uploads/2018/02/schoene-frau-300x300.jpg',
              ),
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
      ),
    );
  }
}
