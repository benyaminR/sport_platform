import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:sport_platform/features/community/domain/usecase/add_post_use_case.dart';
import 'package:sport_platform/features/community/domain/usecase/get_posts_use_case.dart';
import 'package:sport_platform/features/community/domain/usecase/remove_post_use_case.dart';
import 'package:sport_platform/features/community/domain/usecase/update_post_use_case.dart';
import 'package:sport_platform/utils/usecases/params.dart';

import 'community_event.dart';
import 'community_state.dart';

@singleton
class CommunityBloc extends Bloc<CommunityEvent, CommunityState> {

  final AddPostUseCase addPostUseCase;
  final GetPostsUseCase getPostsUseCase;
  final RemovePostUseCase removePostUseCase;
  final UpdatePostUseCase updatePostUseCase;

  CommunityBloc(this.addPostUseCase, this.getPostsUseCase, this.removePostUseCase, this.updatePostUseCase) : super(IdleCommunitiesState());

  static const ADD_POST_ERROR = 'Failed To Post!';
  static const REMOVE_POST_ERROR = 'Failed To Remove!';
  static const UPDATE_POST_ERROR = 'Failed To Update!';
  static const GET_POSTS_ERROR = 'Failed To Get!';

  @override
  Stream<CommunityState> mapEventToState(CommunityEvent event) async* {
    //AddPostEvent
    if(event is AddPostEvent){
      yield LoadingCommunitiesState();
      var data = await addPostUseCase(WithParams(param:event.postData));
      yield data.fold(
              (l) => ErrorCommunitiesState(msg: ADD_POST_ERROR),
              (r) => LoadedCommunitiesState(posts: [r])
      );
    }

    //GetPostsEvent
    if(event is GetPostsEvent){
      yield LoadingCommunitiesState();
      var data = await getPostsUseCase(WithParams(param:event.criteriaData));
      yield data.fold(
              (l) => ErrorCommunitiesState(msg: GET_POSTS_ERROR),
              (r) => LoadedCommunitiesState(posts: r)
      );
    }

    //RemovePostEvent
    if(event is RemovePostEvent){
      yield LoadingCommunitiesState();
      var data = await removePostUseCase(WithParams(param:event.postData));
      yield data.fold(
              (l) => ErrorCommunitiesState(msg: REMOVE_POST_ERROR),
              (r) => LoadedCommunitiesState(posts: [r])
      );
    }

    //UpdatePostEvent
    if(event is UpdatePostEvent){
      yield LoadingCommunitiesState();
      var data = await updatePostUseCase(WithParams(param:event.postData));
      yield data.fold(
              (l) => ErrorCommunitiesState(msg: UPDATE_POST_ERROR),
              (r) => LoadedCommunitiesState(posts: [r])
      );
    }
  }
}
