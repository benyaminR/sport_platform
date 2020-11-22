import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:sport_platform/features/community/domain/entity/community_share.dart';

import 'community_comment.dart';
import 'community_like.dart';
import 'community_media.dart';

class CommunityPost extends Equatable{
  final String description;
  final String date;
  final List<CommunityMedia> media;
  final String username;
  final String thumbnail;
  final List<CommunityComment> comments;
  final List<CommunityLike> likes;
  final List<CommunityShare> shares;
  final String docID;

  CommunityPost({@required this.description, @required this.date, @required this.media,@required this.username, @required this.thumbnail, @required this.comments, @required this.likes, @required this.shares,@required this.docID});
  @override
  List<Object> get props => [description, date, media,username, thumbnail, comments, likes, shares,docID];
}