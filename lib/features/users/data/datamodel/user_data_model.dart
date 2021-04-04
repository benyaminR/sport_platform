import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sport_platform/features/courses/data/datamodel/course_data_model.dart';
import 'package:sport_platform/features/courses/domain/enitity/course.dart';
import 'package:sport_platform/features/users/data/datamodel/tip_data_model.dart';
import 'package:sport_platform/features/users/domain/entity/tip.dart';
import 'package:sport_platform/features/users/domain/entity/user.dart';



class UserDataModel extends User{

  UserDataModel({
    @required tips,
    @required joinedDate,
    @required description,
    @required username,
    @required subscription,
    @required profileImage,
    @required friends,
    @required createdCourses,
    @required isTrainer,
    @required isVerified,
    @required purchasedCourses,
    }):super(
      tips: tips,
      joinedDate: joinedDate,
      description: description,
      username: username,
      subscription: subscription,
      profileImage: profileImage,
      friends: friends,
      createdCourses: createdCourses,
      isTrainer: isTrainer,
      isVerified: isVerified,
      purchasedCourses: purchasedCourses
  );

  static Map<String,dynamic> toMap(User user)=> {
    'tips': user.tips.map((e) => TipDataModel.toMap(e)).toList(),
    'joinedDate': user.joinedDate,
    'description': user.description,
    'username': user.username,
    'subscription': user.subscription,
    'profileImage': user.profileImage,
    'friends': user.friends,
    'createdCourses': user.createdCourses.map((e) => CourseDataModel.toMap(e)).toList(),
    'isTrainer': user.isTrainer,
    'isVerified': user.isVerified,
    'purchasedCourses': user.purchasedCourses.map((e) => CourseDataModel.toMap(e)).toList()
  };

  factory UserDataModel.fromSnapshot(DocumentSnapshot snapshot){

    print(snapshot.data()['tips']);
    return UserDataModel(
      tips: snapshot.data()['tips'] != null ? (snapshot.data()['tips'] as List<dynamic>).map((e) => TipDataModel.fromMap(e)).toList(): List<Tip>(),
      joinedDate: snapshot.data()['joinedDate']??"",
      description: snapshot.data()['description']??"",
      username: snapshot.data()['username']??"",
      subscription: snapshot.data()['subscription']??"",
      profileImage: snapshot.data()['profileImage']??"",
      friends: snapshot.data()["friends"] != null ?  (snapshot.data()['friends'] as List<dynamic>).map((e) => e.toString()).toList() : List<String>(),
      createdCourses:snapshot.data()["createdCourses"] != null ? (snapshot.data()['createdCourses'] as List<dynamic>).map((e) => CourseDataModel.fromMap(e)).toList() : List<Course>(),
      isTrainer: snapshot.data()['isTrainer']?? false,
      isVerified: snapshot.data()['isVerified']?? false,
      purchasedCourses: snapshot.data()["purchasedCourses"] != null ? (snapshot.data()['purchasedCourses'] as List<dynamic>).map((e) => CourseDataModel.fromMap(e)).toList(): List<Course>()
  );
  }

  static UserDataModel fromUser(User user) => UserDataModel(
    tips: user.tips.map((e) => TipDataModel.fromTip(e)).toList(),
    joinedDate: user.joinedDate,
    description: user.description,
    username: user.username,
    subscription: user.subscription,
    profileImage: user.profileImage,
    friends: user.friends,
    createdCourses: user.createdCourses.map((e) => CourseDataModel.fromCourse(e)).toList(),
    isTrainer: user.isTrainer,
    isVerified: user.isVerified,
    purchasedCourses: user.purchasedCourses.map((e) => CourseDataModel.fromCourse(e)).toList()
  );



}