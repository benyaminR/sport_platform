import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:sport_platform/features/users/domain/entity/user.dart';
import 'package:sport_platform/features/users/domain/repository/users_repo.dart';

import 'package:sport_platform/utils/error/failure.dart';
import 'package:sport_platform/utils/usecases/params.dart';
import 'package:sport_platform/utils/usecases/usecase.dart';

class GetUsersUseCase extends UseCase<List<User>,WithParams>{

  final UsersRepo repo;

  GetUsersUseCase({@required this.repo});


  @override
  Future<Either<Failure, List<User>>> call(WithParams params) => repo.getUsers(params.param);
}