
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:sport_platform/features/community/domain/entity/community_post.dart';
import 'package:sport_platform/features/courses/domain/enitity/criteria.dart';

@immutable
abstract class CommunityEvent extends Equatable{}


class AddPostEvent extends CommunityEvent{
  final CommunityPost postData;

  AddPostEvent({@required this.postData});

  @override
  List<Object> get props => [postData];
}

class GetPostsEvent extends CommunityEvent{
  final Criteria criteriaData;

  GetPostsEvent({@required this.criteriaData});

  @override
  List<Object> get props => [criteriaData];
}

class RemovePostEvent extends CommunityEvent{
  final CommunityPost postData;

  RemovePostEvent({@required this.postData});

  @override
  List<Object> get props => [postData];
}

class UpdatePostEvent extends CommunityEvent{
  final CommunityPost postData;

  UpdatePostEvent({@required this.postData});

  @override
  List<Object> get props => [postData];
}

