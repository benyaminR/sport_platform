import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class VideoData extends Equatable{
  final String thumbnail;
  final int viewCount;
  final String source;
  final String creationDate;


  VideoData({@required this.thumbnail, this.viewCount, this.source, this.creationDate});
  @override
  List<Object> get props => [thumbnail, viewCount, source, creationDate];
}