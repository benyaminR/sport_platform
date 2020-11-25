
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class Criteria extends Equatable{
  final String field;
  final String data;

  Criteria({@required this.field,@required this.data});
  @override
  List<Object> get props => [field, data];
}