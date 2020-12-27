import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class CommunityLike extends Equatable{
  final String date;
  final String username;
  final String thumbnail;
  final String uid;

  CommunityLike({@required this.uid,@required this.date,@required this.username, @required this.thumbnail, });
  @override
  List<Object> get props => [uid,date, username, thumbnail];
}