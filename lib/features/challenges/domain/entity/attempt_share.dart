import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class AttemptShare extends Equatable{
  final String date;
  final String user;
  final String username;
  final String thumbnail;
  final String type;


  AttemptShare({@required this.date, @required this.user, @required this.username, @required this.thumbnail, @required this.type});
  @override
  List<Object> get props => [date, user, username, thumbnail, type];
}