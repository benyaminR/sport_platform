import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:sport_platform/features/community/domain/entity/community_post.dart';

@immutable
abstract class CommunityState extends Equatable{}


class IdleCommunitiesState extends CommunityState{
  @override
  List<Object> get props => [];
}

class LoadingCommunitiesState extends CommunityState{
  @override
  List<Object> get props => [];
}

class LoadedCommunitiesState extends CommunityState{
  final List<CommunityPost> posts;

  LoadedCommunitiesState({@required this.posts});

  @override
  List<Object> get props => [posts];
}


class ErrorCommunitiesState extends CommunityState{
  final String msg;

  ErrorCommunitiesState({@required this.msg});

  @override
  List<Object> get props => [msg];
}