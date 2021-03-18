import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:sport_platform/features/discovery/domain/entity/trending_course.dart';
import 'package:sport_platform/features/discovery/domain/entity/trending_trainer.dart';

class DiscoveryData extends Equatable{

  final List<TrendingTrainer> trendingTrainers;
  final List<TrendingCourse> trendingCourses;

  DiscoveryData({
    @required this.trendingTrainers,
    @required this.trendingCourses
  });


  @override
  List<Object> get props => throw UnimplementedError();

}