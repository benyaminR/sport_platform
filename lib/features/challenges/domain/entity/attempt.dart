import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:sport_platform/features/challenges/domain/entity/attempt_comment.dart';
import 'package:sport_platform/features/challenges/domain/entity/attempt_like.dart';
import 'package:sport_platform/features/challenges/domain/entity/attempt_media.dart';
import 'package:sport_platform/features/challenges/domain/entity/verification.dart';

import 'attempt_share.dart';

class Attempt extends Equatable{
  final String text;
  final String thumbnail;
  final String user;
  final String username;
  final AttemptMedia media;
  final String date;
  final Verification verificationData;
  final List<AttemptComment> comments;
  final List<AttemptLike> likes;
  final List<AttemptShare> shares;


  Attempt({@required this.text, @required this.thumbnail, @required this.user, @required this.username, @required this.media, @required this.date, @required this.verificationData, @required this.comments, @required this.likes, @required this.shares});
  @override
  List<Object> get props => [text, thumbnail, user, username, media, date, verificationData, comments, likes, shares];
}