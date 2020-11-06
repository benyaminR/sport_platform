import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class TrainerWorkout extends Equatable{
  final String workoutPath;
  final String title;


  TrainerWorkout({@required this.workoutPath, @required this.title});
  @override
  List<Object> get props => [workoutPath, title];
}