import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:sport_platform/features/community/domain/entity/community_post.dart';
import 'package:sport_platform/features/users_feature/domain/entity/user.dart';
import 'package:sport_platform/features/users_feature/domain/repository/users_repo.dart';
import 'package:sport_platform/utils/error/failure.dart';
import 'package:sport_platform/utils/usecases/params.dart';
import 'package:sport_platform/utils/usecases/usecase.dart';

class AddUserUseCase extends UseCase<User,WithParams>{

  final UsersRepo repo;

  AddUserUseCase({@required this.repo});


  @override
  Future<Either<Failure, User>> call(WithParams params) => repo.addUser(params.param);
}