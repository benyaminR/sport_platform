import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sport_platform/utils/components/profile_picture.dart';

class StoryAdd extends StatefulWidget {
  StoryAdd();

  _StoryAddState createState() => _StoryAddState();
}

class _StoryAddState extends State<StoryAdd> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 10.0,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - 10,
            child: Stack(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: (MediaQuery.of(context).size.height) - 10,
                  decoration: new BoxDecoration(
                    image: DecorationImage(
                      image: new NetworkImage(
                          "https://www.wochenblatt.de/media/2020/06/07/42199020-l_202006070945_full.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: 8.0, top: 20.0, bottom: 0.0, right: 8.0),
                  child: Container(
                    alignment: Alignment.topCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        Text(
                          "Neue Story",
                          style: TextStyle(
                            fontSize: 22,
                            color: Color(0xFFFFFFFF),
                          ),
                        ),
                        GestureDetector(
                          child: Icon(
                            Icons.send,
                            size: 28,
                            color: Colors.white,
                          ),
                          onTap: () => {
                            Navigator.of(context).pop(),
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
