import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:sport_platform/archive/community/domain/repository/community_repo.dart';
import 'package:sport_platform/utils/error/failure.dart';
import 'package:sport_platform/utils/usecases/params.dart';
import 'package:sport_platform/utils/usecases/usecase.dart';

@singleton
class LikePostUseCase extends UseCase<void,WithParams>{

  final CommunityRepo repo;

  LikePostUseCase({@required this.repo});


  @override
  Future<Either<Failure, void>> call(WithParams params) => repo.like(params.param);
}