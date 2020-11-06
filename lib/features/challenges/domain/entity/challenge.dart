import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:sport_platform/features/chat/domain/entity/media.dart';
import 'attempt.dart';
import 'challenge_comment.dart';

class Challenge extends Equatable{
  final String date;
  final String trainerId;
  final String trainerName;
  final String trainerThumbnail;
  final String description;
  final List<Media> medias;
  final List<Attempt> attempts;
  final double difficulty;
  final List<ChallengeComment> comments;


  Challenge({@required this.date, @required this.trainerId, @required this.trainerName, @required this.trainerThumbnail, @required this.description, @required this.medias, @required this.attempts, @required this.difficulty, @required this.comments});
  @override
  List<Object> get props => [date, trainerId, trainerName, trainerThumbnail, description, medias, attempts, difficulty, comments];
}