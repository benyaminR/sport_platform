import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:sport_platform/features/discovery/domain/entity/discovery.dart';
import 'package:sport_platform/features/discovery/domain/entity/trending_course.dart';
import 'package:sport_platform/features/discovery/domain/entity/trending_trainer.dart';

class DiscoveryDataMode extends DiscoveryData{

  DiscoveryDataMode({@required trendingTrainers, @required trendingCourses})
      :super(trendingCourses: trendingCourses,trendingTrainers: trendingTrainers);

  factory DiscoveryDataMode.fromSnapshot(DocumentSnapshot snapshot){
    return DiscoveryDataMode(
      trendingTrainers: snapshot.data()["trendingTrainers"] == null ?
      List<TrendingTrainer>()
          :
      (snapshot.data()["trendingTrainers"] as List<dynamic>).map((e) => TrendingTrainer(
        thumbnail: e["thumbnail"],
        name: e["name"],
        id: e["id"],
      )).toList(),
      trendingCourses: snapshot.data()["trendingCourses"] == null ?
      List<TrendingCourse>()
          :
      (snapshot.data()["trendingCourses"] as List<dynamic>).map((e) => TrendingCourse(
        thumbnail: e["thumbnail"],
        name: e["name"],
        id: e["id"],
      )).toList(),
    );
  }
}