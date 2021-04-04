import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:sport_platform/features/courses/domain/enitity/course.dart';
import 'package:sport_platform/features/users/domain/entity/tip.dart';

class User extends Equatable{
  final String username;
  final String description;
  final String profileImage;
  final String subscription;
  final List<Course> createdCourses;
  final List<Course> purchasedCourses;
  final List<Tip> tips;
  final List<String> friends;
  final String joinedDate;
  final bool isVerified;
  final bool isTrainer;

  User({
    @required this.username,
    @required this.description,
    @required this.profileImage,
    @required this.subscription,
    @required this.createdCourses,
    @required this.purchasedCourses,
    @required this.tips,
    @required this.friends,
    @required this.joinedDate,
    @required this.isVerified,
    @required this.isTrainer,
});

  @override
  List<Object> get props => [
    username,
    description,
    profileImage,
    subscription,
    createdCourses,
    purchasedCourses,
    tips,
    friends,
    joinedDate,
    isVerified,
    isTrainer,
  ];
}