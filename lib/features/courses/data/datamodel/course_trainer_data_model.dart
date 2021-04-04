import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:sport_platform/features/courses/data/datamodel/course_data_model.dart';
import 'package:sport_platform/features/courses/domain/enitity/course_trainer.dart';

class CourseTrainerDataModel extends CourseTrainer{
  CourseTrainerDataModel({
    @required name,
    @required thumbnail,
    @required path
  })
      : super(
      name:name,
      thumbnail:thumbnail,
      path:path);

  factory CourseTrainerDataModel.fromSnapShot(DocumentSnapshot snapshot) =>
      CourseTrainerDataModel(name: snapshot.data()['trainer']['name'],
          thumbnail: snapshot.data()['trainer']['thumbnail'],
          path: snapshot.data()['trainer']['path']
      );


  factory CourseTrainerDataModel.fromMap(Map<String,dynamic> snapshot) =>
      CourseTrainerDataModel(name: snapshot['trainer']['name'],
          thumbnail: snapshot['trainer']['thumbnail'],
          path: snapshot['trainer']['path']
      );
  static Map<String,dynamic> toMap(CourseDataModel courseDataModel) =>
      {
        'name': courseDataModel.trainer.name,
        'thumbnail': courseDataModel.trainer.thumbnail,
        'path': courseDataModel.trainer.path
      };


}