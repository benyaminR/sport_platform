import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:sport_platform/features/courses/domain/enitity/video.dart';

class ContentSectionData extends Equatable{
  final String description;
  final List<VideoData> videos;


  ContentSectionData({@required this.description,@required this.videos});
  @override
  List<Object> get props => [description, videos];
}