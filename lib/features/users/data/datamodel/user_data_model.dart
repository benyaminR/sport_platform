import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sport_platform/features/users/data/datamodel/tip_data_model.dart';
import 'package:sport_platform/features/users/data/datamodel/user_course_data_model.dart';
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
    'createdCourses': user.createdCourses.map((e) => UserCourseDataModel.toMap(e)).toList(),
    'isTrainer': user.isTrainer,
    'isVerified': user.isVerified,
    'purchasedCourses': user.purchasedCourses.map((e) => UserCourseDataModel.toMap(e)).toList()
  };

  factory UserDataModel.fromSnapshot(DocumentSnapshot snapshot)=> UserDataModel(
      tips: (snapshot.data()['tips'] as List<dynamic>).map((e) => TipDataModel.fromMap(e)).toList(),
      joinedDate: snapshot.data()['joinedDate'],
      description: snapshot.data()['description'],
      username: snapshot.data()['username'],
      subscription: snapshot.data()['subscription'],
      profileImage: snapshot.data()['profileImage'],
      friends: (snapshot.data()['friends'] as List<dynamic>).map((e) => e.toString()).toList(),
      createdCourses: (snapshot.data()['createdCourses'] as List<dynamic>).map((e) => UserCourseDataModel.fromMap(e)).toList(),
      isTrainer: snapshot.data()['isTrainer'],
      isVerified: snapshot.data()['isVerified'],
      purchasedCourses: (snapshot.data()['purchasedCourses'] as List<dynamic>).map((e) => UserCourseDataModel.fromMap(e)).toList()
  );



}