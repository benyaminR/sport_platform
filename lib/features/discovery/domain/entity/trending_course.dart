import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class TrendingCourse extends Equatable{

  final String name;
  final String id;
  final String thumbnail;

  TrendingCourse({@required this.name,@required this.id,@required this.thumbnail});


  @override
  List<Object> get props => [name,id,thumbnail];

}