import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:sport_platform/features/users_feature/data/datamodel/user_course_data_model.dart';
import 'package:sport_platform/features/users_feature/domain/entity/user.dart';

class UserDataModel extends User{
  UserDataModel({
    @required courses,
    @required friends,
    @required profileImage,
    @required subscription,
    @required username
  })
      : super(
      courses:courses ,
      friends: friends,
      profileImage: profileImage,
      subscription: subscription,
      username: username
  );

  factory UserDataModel.fromSnapshot(DocumentSnapshot snapshot) =>
      UserDataModel(
          courses: (snapshot.data()['courses'] as List<dynamic>).map((e) => UserCourseDataModel.fromSnapshot(snapshot)).toList(),
          friends: (snapshot.data()['friends'] as List<dynamic>).map((e) => e.toString()).toList(),
          profileImage: snapshot.data()['profileImage'],
          subscription: snapshot.data()['subscription'],
          username: snapshot.data()['username']
      );

  static Map<String,dynamic> toMap(User dataModel)=>{
    'courses':dataModel.courses.map((e) => UserCourseDataModel.toMap(e)).toList(),
    'friends':dataModel.friends,
    'profileImage':dataModel.profileImage,
    'subscription':dataModel.subscription,
    'username':dataModel.username,
  };

}