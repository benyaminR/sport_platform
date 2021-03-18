import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:sport_platform/archive/community/domain/entity/community_post.dart';
import 'package:sport_platform/archive/community/domain/repository/community_repo.dart';
import 'package:sport_platform/utils/error/failure.dart';
import 'package:sport_platform/utils/usecases/params.dart';
import 'package:sport_platform/utils/usecases/usecase.dart';


@singleton
class RemovePostUseCase extends UseCase<CommunityPost,WithParams>{

  final CommunityRepo repo;

  RemovePostUseCase({@required this.repo});


  @override
  Future<Either<Failure, CommunityPost>> call(WithParams params) => repo.removePost(params.param);
}