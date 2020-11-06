import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:sport_platform/features/users_feature/domain/entity/user_challenge.dart';
import 'package:sport_platform/features/users_feature/domain/entity/user_course.dart';
import 'package:sport_platform/features/users_feature/domain/entity/user_workout.dart';

class User extends Equatable{
  final String UID;
  final List<String> friends;
  final String subscription;
  final List<UserCourse> courses;
  final String username;
  final String profileImage;
  final List<UserChallenge> challenges;
  final List<UserWorkout> workouts;



  User({@required this.UID, @required this.friends, @required this.subscription, @required this.courses, @required this.username, @required this.profileImage, @required this.challenges, @required this.workouts});

  @override
  List<Object> get props => [UID, friends, subscription, courses, username, profileImage, challenges, workouts];
}