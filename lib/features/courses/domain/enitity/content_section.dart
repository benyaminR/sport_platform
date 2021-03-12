import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:sport_platform/features/courses/domain/enitity/video.dart';

class ContentSection extends Equatable{
  final String description;
  final List<Video> videos;


  ContentSection({@required this.description,@required this.videos});
  @override
  List<Object> get props => [description, videos];
}