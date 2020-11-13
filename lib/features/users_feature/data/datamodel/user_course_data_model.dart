
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:sport_platform/features/users_feature/domain/entity/user_course.dart';

class UserCourseDataModel extends UserCourse{


  UserCourseDataModel(
  {
    @required title,
    @required coursePath
}
      ):super(
    title: title,
    coursePath: coursePath,

  );

  factory UserCourseDataModel.fromSnapshot(DocumentSnapshot snapshot)=>
      UserCourseDataModel(
          title: snapshot.data()['title'],
          coursePath: snapshot.data()['coursePath']
      );
  factory UserCourseDataModel.fromMap(Map<String,dynamic> data)=>
      UserCourseDataModel(
          title: data['title'],
          coursePath: data['coursePath']
      );

  static Map<String,dynamic> toMap(UserCourseDataModel dataModel)=>{
    'title':dataModel.title,
    'coursePath':dataModel.coursePath
  };


}