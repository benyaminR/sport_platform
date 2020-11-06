import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class UserWorkout extends Equatable{
  final String workoutPath;
  final String title;



  UserWorkout({@required this.workoutPath, @required this.title});

  @override
  List<Object> get props => [workoutPath, title];
}