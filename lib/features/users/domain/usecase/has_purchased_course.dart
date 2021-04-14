import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:sport_platform/features/users/domain/repository/users_repo.dart';

import 'package:sport_platform/utils/error/failure.dart';
import 'package:sport_platform/utils/usecases/params.dart';
import 'package:sport_platform/utils/usecases/usecase.dart';

@singleton
class HasPurchasedCourse extends UseCase<bool,WithParams>{

  final UsersRepo repo;

  HasPurchasedCourse({@required this.repo});


  @override
  Future<Either<Failure, bool>> call(WithParams params) => repo.hasPurchasedCourse(params.param);
}