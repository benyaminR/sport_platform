import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sport_platform/features/trainers/domain/entity/tip.dart';
import 'package:sport_platform/features/trainers/domain/entity/trainer_course.dart';

class Trainer extends Equatable{
  final String username;
  final String description;
  final List<TrainerCourse> courses;
  final String joinedDate;
  final List<Tip> tips;
  final bool verified;


  Trainer({@required this.username, @required this.description, @required this.courses,@required this.joinedDate, @required this.tips, @required this.verified});
  @override
  List<Object> get props => [username, description, courses, joinedDate, tips, verified];
}