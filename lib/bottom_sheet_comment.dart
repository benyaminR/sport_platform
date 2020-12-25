import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sport_platform/post_comment.dart';
import 'package:sport_platform/utils/components/profile_picture.dart';

void onButtonPressedComment(context,comments,postID) {
  showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(30),
          topRight: const Radius.circular(30),
        ),
      ),
      backgroundColor: Color(0xFF141416),
      context: context,
      builder: (context) {
        return Container(
          child: Container(
            height: 400,
            child: _buildBottomNavigationMenu(context,comments,postID),
          ),
        );
      });
}

SafeArea _buildBottomNavigationMenu(context,comments,postID) {
  return SafeArea(
    child: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Row(
                children: [
                  ProfilePicture(url:comments[0].thumbnail , size: 20.0,),
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          comments[0].username,
                          style: TextStyle(
                            fontSize: 15,
                            color: Color(0xFFFFFFFF),
                          ),
                        ),
                        Text(
                          "Berlin, Deutschland",
                          style: TextStyle(
                            fontSize: 10,
                            color: Color(0xFF707070),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 150,
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 16.0),
                child: Text(
                  comments[0].text,
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF707070),
                  ),
                ),
              ),
              SizedBox(
                height: 80.0,
              ),
              //Text mit Gesture Detector und neuer Seite dann
              GestureDetector(
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Kommentiere hier...',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF707070),
                    ),
                  ),
                ),
                onTap: () => Navigator.of(context).pushNamed('/home/discovery/postComment', arguments: CommunityCommentsPageArgs(
                    comments: comments,
                    postID: postID)
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

