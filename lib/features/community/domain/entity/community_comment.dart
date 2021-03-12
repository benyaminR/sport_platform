import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class CommunityComment extends Equatable{
  final String username;
  final String thumbnail;
  final String postID;
  final String text;
  final String date;


  CommunityComment({@required this.username, @required this.thumbnail, @required this.postID, @required this.text, @required this.date});
  @override
  List<Object> get props => [username, thumbnail, postID, text, date];
}