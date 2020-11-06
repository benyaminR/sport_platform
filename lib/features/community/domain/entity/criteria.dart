import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class Criteria extends Equatable{
  final String filter;
  final String data;


  Criteria({@required this.filter, @required this.data});
  @override
  List<Object> get props => [filter, data];
}