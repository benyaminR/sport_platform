import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class CommentData extends Equatable{
  final String username;
  final String thumbnail;
  final double stars;
  final String text;
  final String date;

  CommentData({@required this.username, this.thumbnail, this.stars, this.text, this.date});
  @override
  List<Object> get props => [username, thumbnail, stars, text, date];
}