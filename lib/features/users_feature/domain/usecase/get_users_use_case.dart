import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:sport_platform/features/community/domain/entity/community_criteria.dart';
import 'package:sport_platform/features/users_feature/domain/entity/user.dart';
import 'package:sport_platform/features/users_feature/domain/repository/users_repo.dart';
import 'package:sport_platform/utils/error/failure.dart';
import 'package:sport_platform/utils/usecases/params.dart';
import 'package:sport_platform/utils/usecases/usecase.dart';

class GetUsersUseCase extends UseCase<List<User>,WithParams>{

  final UsersRepo repo;

  GetUsersUseCase({@required this.repo});


  @override
  Future<Either<Failure, List<User>>> call(WithParams params) => repo.getUsers(params.param);
}