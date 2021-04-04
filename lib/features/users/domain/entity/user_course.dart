import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class UserCourse extends Equatable{
  final String coursePath;
  final String title;
  final String thumbnail;

  UserCourse({@required this.thumbnail, @required this.coursePath, @required this.title});
  @override
  List<Object> get props => [coursePath, title];
}