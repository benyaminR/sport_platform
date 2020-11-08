import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class CommunityComment extends Equatable{
  final String username;
  final String thumbnail;
  final double stars;
  final String text;
  final String date;


  CommunityComment({@required this.username, @required this.thumbnail, @required this.stars, @required this.text, @required this.date});
  @override
  List<Object> get props => [username, thumbnail, stars, text, date];
}