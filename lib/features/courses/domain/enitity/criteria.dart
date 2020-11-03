import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';


class CriteriaData extends Equatable{
  final String field;
  final String data;

  CriteriaData({@required this.field,@required this.data});
  @override
  List<Object> get props => [field, data];
}