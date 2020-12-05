import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sport_platform/utils/components/profile_picture.dart';

class ChatElementDetailviewMessage extends StatefulWidget {
  ChatElementDetailviewMessage();

  _ChatElementDetailviewMessageState createState() =>
      _ChatElementDetailviewMessageState();
}

class _ChatElementDetailviewMessageState
    extends State<ChatElementDetailviewMessage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 150,
      color: Colors.black,
      child: Container(
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: Colors.white,
              ),
              width: 360.0,
              height: 30.0,
              child: Padding(
                padding: const EdgeInsets.only(top: 14.0, left: 16.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Deine Nachricht...',
                    hintStyle: new TextStyle(
                      color: Color(0xFF707070),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 8.0,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: Color(0xFFE4572E),
              ),
              width: 30.0,
              height: 30.0,
              child: Center(
                child: Icon(Icons.send, size: 20.0, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
