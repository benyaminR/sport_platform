import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:sport_platform/features/community/domain/entity/community_media.dart';

class Media extends Equatable{
  final String thumbnail;
  final int viewCount;
  final String source;
  final String creationDate;
  final String mediaType;


  Media({@required this.thumbnail, @required this.viewCount, @required this.source, @required this.creationDate, @required this.mediaType});
  @override
  List<Object> get props => [thumbnail, viewCount, source, creationDate, mediaType];
}