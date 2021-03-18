import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:sport_platform/archive/community/domain/entity/community_comment.dart';
import 'package:sport_platform/archive/community/domain/repository/community_repo.dart';
import 'package:sport_platform/utils/error/failure.dart';
import 'package:sport_platform/utils/usecases/params.dart';
import 'package:sport_platform/utils/usecases/usecase.dart';

@singleton
class CommentCommunityPostUseCase extends UseCase<CommunityComment,WithParams>{

  final CommunityRepo repo;

  CommentCommunityPostUseCase({@required this.repo});


  @override
  Future<Either<Failure, CommunityComment>> call(WithParams params) => repo.commentPost(params.param as CommunityComment);
}