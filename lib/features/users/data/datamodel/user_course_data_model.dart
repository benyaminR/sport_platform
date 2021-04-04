import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:sport_platform/features/users/domain/entity/user_course.dart';

class UserCourseDataModel extends UserCourse{

  UserCourseDataModel({@required coursePath, @required title, @required thumbnail}):super(
    coursePath: coursePath,
    title: title,
    thumbnail:thumbnail
  );


  factory UserCourseDataModel.fromMap(Map<String,dynamic> data) => UserCourseDataModel(
    title: data['title'],
    coursePath: data['coursePath'],
    thumbnail:data['thumbnail']
  );

  static Map<String,dynamic> toMap(UserCourse course)=>{
    'thumbnail':course.thumbnail,
    'coursePath':course.coursePath,
    'title':course.title,
  };

  static UserCourseDataModel fromUserCourse(UserCourse e)=> UserCourseDataModel(coursePath: e.coursePath, title: e.title, thumbnail: e.thumbnail);


}