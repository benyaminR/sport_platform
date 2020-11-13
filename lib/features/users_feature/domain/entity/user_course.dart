import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class UserCourse extends Equatable{
  final String coursePath;
  final String title;

  UserCourse({@required this.coursePath, @required this.title});

  @override
  List<Object> get props => [coursePath, title];
}