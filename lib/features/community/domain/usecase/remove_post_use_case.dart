import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:sport_platform/features/community/domain/entity/post.dart';
import 'package:sport_platform/features/community/domain/repository/community_repo.dart';
import 'package:sport_platform/utils/error/failure.dart';
import 'package:sport_platform/utils/usecases/params.dart';
import 'package:sport_platform/utils/usecases/usecase.dart';

@singleton
class RemovePostUseCase extends UseCase<Post,WithParams>{

  final CommunityRepo repo;

  RemovePostUseCase({@required this.repo});


  @override
  Future<Either<Failure, Post>> call(WithParams params) => repo.removePost(params.param);
}