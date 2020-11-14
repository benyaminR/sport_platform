import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class ChatCriteria extends Equatable{
  final String filter;
  final String data;

  ChatCriteria({@required this.filter, @required this.data});
  @override
  List<Object> get props => [filter, data];
}