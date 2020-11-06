import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:sport_platform/features/community/domain/entity/share.dart';

import 'comment.dart';
import 'like.dart';
import 'media.dart';

class Post extends Equatable{
  final String description;
  final String date;
  final List<Media> media;
  final String UID;
  final String username;
  final String thumbnail;
  final List<Comment> comments;
  final List<Like> likes;
  final List<Share> shares;


  Post({@required this.description, @required this.date, @required this.media, @required this.UID, @required this.username, @required this.thumbnail, @required this.comments, @required this.likes, @required this.shares});
  @override
  List<Object> get props => [description, date, media, UID, username, thumbnail, comments, likes, shares];
}