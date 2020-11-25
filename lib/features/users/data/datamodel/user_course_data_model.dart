import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:sport_platform/features/users/domain/entity/user_course.dart';

class UserCourseDataModel extends UserCourse{

  UserCourseDataModel({@required coursePath, @required title}):super(
    coursePath: coursePath,
    title: title
  );


  factory UserCourseDataModel.fromMap(Map<String,dynamic> data) => UserCourseDataModel(
    title: data['title'],
    coursePath: data['coursePath']
  );

  static Map<String,dynamic> toMap(UserCourse course)=>{
    'coursePath':course.coursePath,
    'title':course.title,
  };


}