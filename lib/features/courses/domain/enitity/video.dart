import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class Video extends Equatable{
  final String thumbnail;
  final int viewCount;
  final String source;
  final String creationDate;

  Video({@required this.thumbnail,@required this.viewCount,@required this.source,@required this.creationDate});
  @override
  List<Object> get props => [thumbnail, viewCount, source, creationDate];
}