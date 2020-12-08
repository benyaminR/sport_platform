import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sport_platform/utils/components/profile_picture.dart';

class PostAdd extends StatefulWidget {
  PostAdd();

  _PostAddState createState() => _PostAddState();
}

class _PostAddState extends State<PostAdd> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
       child: Column(
          children: [
            SizedBox(
              height: 10.0,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: EdgeInsets.only(
                    left: 8.0, top: 20.0, bottom: 0.0, right: 8.0),
                child: Container(
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
                        "Neuer Beitrag",
                        style: TextStyle(
                          fontSize: 22,
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                      GestureDetector(
                        child: RotationTransition(
                          turns: new AlwaysStoppedAnimation(-30 / 360),
                          child: Icon(
                            Icons.send,
                            size: 28,
                            color: Colors.white,
                          ),
                        ),
                        onTap: () => {
                          Navigator.of(context).pop(),
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Color(0xFF141416),
              ),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 400,
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(
                    left: 16.0, top: 16.0, right: 16.0, bottom: 8.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Media",
                        style: TextStyle(
                            color: Colors.white,
                            // fontWeight: FontWeight.bold,
                            fontSize: 20.0),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height - 460,
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.add_circle_outline,
                        size: 28,
                        color: Color(0xFF707070),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Color(0xFF141416),
              ),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 400,
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(
                    left: 16.0, top: 16.0, right: 16.0, bottom: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Beschreibung",
                      style: TextStyle(
                          color: Colors.white,
                          // fontWeight: FontWeight.bold,
                          fontSize: 20.0),
                    ),
                    SizedBox(
                      height: 4.0,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Hier schreiben...",
                        hintStyle: new TextStyle(
                          color: Color(0xFF707070),
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
