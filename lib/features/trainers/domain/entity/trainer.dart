import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sport_platform/features/trainers/domain/entity/tip.dart';
import 'package:sport_platform/features/trainers/domain/entity/trainer_challenge.dart';
import 'package:sport_platform/features/trainers/domain/entity/trainer_course.dart';
import 'package:sport_platform/features/trainers/domain/entity/trainer_workout.dart';

class Trainer extends Equatable{
  final String UID;
  final String name;
  final String description;
  final List<TrainerCourse> courses;
  final List<TrainerChallenge> challenges;
  final List<TrainerWorkout> workouts;
  final String joinedDate;
  final List<Tip> tips;
  final bool verified;


  Trainer({@required this.UID, @required this.name, @required this.description, @required this.courses, @required this.challenges, @required this.workouts, @required this.joinedDate, @required this.tips, @required this.verified});
  @override
  List<Object> get props => [UID, name, description, courses, challenges, workouts, joinedDate, tips, verified];
}