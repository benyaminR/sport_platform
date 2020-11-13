import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:sport_platform/features/users_feature/domain/entity/user_course.dart';

class User extends Equatable{
  final List<String> friends;
  final String subscription;
  final List<UserCourse> courses;
  final String username;
  final String profileImage;


  User({@required this.friends, @required this.subscription, @required this.courses, @required this.username, @required this.profileImage});

  @override
  List<Object> get props => [friends, subscription, courses, username, profileImage,];
}