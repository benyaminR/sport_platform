import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class AttemptMedia extends Equatable{
  final String date;
  final String user;
  final String username;
  final String thumbnail;


  AttemptMedia({@required this.date, @required this.user, @required this.username, @required this.thumbnail, });
  @override
  List<Object> get props => [date, user, username, thumbnail];
}