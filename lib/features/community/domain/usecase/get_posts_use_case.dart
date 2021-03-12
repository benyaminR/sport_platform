import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:sport_platform/features/community/domain/entity/community_post.dart';
import 'package:sport_platform/features/community/domain/repository/community_repo.dart';
import 'package:sport_platform/utils/error/failure.dart';
import 'package:sport_platform/utils/usecases/params.dart';
import 'package:sport_platform/utils/usecases/usecase.dart';

@singleton
class GetPostsUseCase extends UseCase<List<CommunityPost>,WithParams>{

  final CommunityRepo repo;

  GetPostsUseCase({@required this.repo});


  @override
  Future<Either<Failure, List<CommunityPost>>> call(WithParams params) => repo.getPosts(params.param);
}