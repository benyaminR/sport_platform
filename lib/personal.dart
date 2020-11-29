import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sport_platform/personal_course_box.dart';
import 'package:sport_platform/personal_course_box_black.dart';
import 'file:///C:/Users/chris/Documents/SourceCode/sport_platform/lib/utils/components/profile_picture_large.dart';
import 'package:sport_platform/utils/components/profile_picture_large_2.dart';

class Personal extends StatefulWidget {
  Personal();

  _PersonalState createState() => _PersonalState();
}

class _PersonalState extends State<Personal> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              ProfilePictureLarge2(),
              SizedBox(
                height: 10,
              ),
              Text(
                '@jacqueline',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Color(0xFF141416),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: PersonalCourseBoxBlack(),
                ),
              ),
              SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
