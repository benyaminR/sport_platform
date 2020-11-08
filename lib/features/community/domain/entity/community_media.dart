import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class CommunityMedia extends Equatable{
  final String thumbnail;
  final int viewCount;
  final String source;
  final String creationDate;
  final String mediaType;


  CommunityMedia({@required this.thumbnail, @required this.viewCount, @required this.source, @required this.creationDate, @required this.mediaType});
  @override
  List<Object> get props => [thumbnail, viewCount, source, creationDate, mediaType];
}