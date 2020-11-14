import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sport_platform/features/trainers/data/datamodel/tip_data_model.dart';
import 'package:sport_platform/features/trainers/data/datamodel/trainer_course_data_model.dart';
import 'package:sport_platform/features/trainers/domain/entity/trainer.dart';


class TrainerDataModel extends Trainer{

  final List<TipDataModel> tips;
  final List<TrainerCourseDataModel> courses;

  TrainerDataModel({
    @required username,
    @required description,
    @required this.courses,
    @required joinedDate,
    @required this.tips,
    @required verified
  }):super(
      username:username,
      description:description,
      courses:courses,
      joinedDate:joinedDate,
      tips:tips,
      verified:verified,
  );


  Map<String,dynamic> toMap()=>{
    'username':username,
    'description':description,
    'courses':courses.map((e) => e.toMap()).toList(),
    'joinedDate':joinedDate,
    'tips':tips.map((e) => e.toMap()).toList(),
    'verified':verified,
  };

  factory TrainerDataModel.fromSnapshot(DocumentSnapshot snapshot)=> TrainerDataModel(
      username:snapshot.data()['username'],
      description: snapshot.data()['description'],
      courses: (snapshot.data()['courses'] as List<dynamic>).map((e) => TrainerCourseDataModel.fromMap(e)).toList(),
      joinedDate:snapshot.data()['joinedDate'],
      tips:(snapshot.data()['tips'] as List<dynamic>).map((e) => TipDataModel.fromMap(e)).toList(),
      verified:snapshot.data()['verified'],
  );




}