import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'chat_element_detailview_left.dart';
import 'chat_element_detailview_right.dart';
import 'chat_element_detailview_top.dart';



class ChatDetailview extends StatefulWidget {
  ChatDetailview();

  _ChatDetailviewState createState() => _ChatDetailviewState();
}

class _ChatDetailviewState extends State<ChatDetailview> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: (MediaQuery.of(context).size.height),
        color: Colors.black,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10.0,
              ),
              ChatElementDetailviewTop(),
              SizedBox(
                height: 30.0,
              ),
              ChatElementDetailviewRight(),
              SizedBox(
                height: 30.0,
              ),
              ChatElementDetailviewLeft(),
              SizedBox(
                height: 30.0,
              ),
              ChatElementDetailviewRight(),
              SizedBox(
                height: 30.0,
              ),
              ChatElementDetailviewLeft(),
              SizedBox(
                height: 30.0,
              ),
              ChatElementDetailviewRight(),
              SizedBox(
                height: 30.0,
              ),
              ChatElementDetailviewLeft(),
            ],
          ),
        ),
      ),
    );
  }
}
