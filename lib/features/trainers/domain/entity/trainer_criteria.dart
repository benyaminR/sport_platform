import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class TrainerCriteria extends Equatable{
  final String filter;
  final String data;

  TrainerCriteria({@required this.filter, @required this.data});
  @override
  List<Object> get props => [filter, data];
}