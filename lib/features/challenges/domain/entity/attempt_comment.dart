import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class AttemptComment extends Equatable{
  final String text;
  final String date;
  final String user;
  final String username;
  final String thumbnail;


  AttemptComment({@required this.text, @required this.date, @required this.user, @required this.username, @required this.thumbnail, });
  @override
  List<Object> get props => [text, date, user, username, thumbnail];
}