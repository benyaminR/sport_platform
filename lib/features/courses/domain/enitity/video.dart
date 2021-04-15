import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class Video extends Equatable{
  final String thumbnail;
  final String source;
  final String title;
  final String description;

  Video({@required this.title,@required this.description, @required this.thumbnail,@required this.source});
  @override
  List<Object> get props => [thumbnail, source];
}