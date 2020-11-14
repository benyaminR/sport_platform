import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:sport_platform/features/trainers/domain/entity/trainer_course.dart';

class TrainerCourseDataModel extends TrainerCourse{

  TrainerCourseDataModel({@required coursePath, @required title}):super(
    coursePath: coursePath,
    title: title
  );


  factory TrainerCourseDataModel.fromMap(Map<String,dynamic> data)=>TrainerCourseDataModel(
    title: data['title'],
    coursePath: data['coursePath']
  );

  Map<String,dynamic> toMap()=>{
    'coursePath':coursePath,
    'title':title,
  };


}