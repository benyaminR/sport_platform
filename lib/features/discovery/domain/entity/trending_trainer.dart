import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class TrendingTrainer extends Equatable{

  final String name;
  final String id;
  final String thumbnail;

  TrendingTrainer({@required this.name,@required this.id,@required this.thumbnail});


  @override
  List<Object> get props => [name,id,thumbnail];

}