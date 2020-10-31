import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:sport_platform/features/authentication/domain/entity/video_data.dart';

class ContentSectionData extends Equatable{
  final String description;
  final List<VideoData> video;


  ContentSectionData({@required this.description, this.video});
  @override
  List<Object> get props => [description, video];
}