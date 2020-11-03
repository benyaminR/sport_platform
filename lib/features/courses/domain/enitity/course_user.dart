import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class CourseUser extends Equatable{
  final String name;
  final String thumbnail;
  final String path;

  CourseUser({@required this.name,@required this.thumbnail,@required this.path});
  @override
  List<Object> get props => [name,thumbnail,path];

}