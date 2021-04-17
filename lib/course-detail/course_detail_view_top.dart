import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sport_platform/features/courses/domain/enitity/course_trainer.dart';
import 'package:sport_platform/personal.dart';
import 'package:sport_platform/utils/components/profile_picture.dart';

class CourseDetailViewTop extends StatelessWidget {
  final CourseTrainer trainer;

  const CourseDetailViewTop({Key key,@required this.trainer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 70.0,
      color: Colors.black,
      child: Padding(
        padding: EdgeInsets.only(left: 8.0, bottom: 0.0, top: 16.0),
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
              GestureDetector(
                onTap:()=> Navigator.of(context).pushNamed('/home/personal',arguments: PersonalArgs(userID: trainer.path)) ,
                child: ProfilePicture(
                  url:trainer.thumbnail,
                  size: 20.0,
                ),
              ),
              SizedBox(
                width: 4.0,
              ),
              Text(
                trainer.name,
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
