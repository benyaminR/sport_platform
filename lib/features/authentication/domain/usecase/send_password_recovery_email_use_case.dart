import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:sport_platform/features/authentication/domain/entity/auth.dart';
import 'package:sport_platform/features/authentication/domain/repository/auth_repo.dart';
import 'package:sport_platform/utils/error/failure.dart';
import 'package:sport_platform/utils/usecases/no_params.dart';
import 'package:sport_platform/utils/usecases/usecase.dart';

@singleton
class CheckAuthenticationUseCase extends UseCase<void,NoParams>{

  final AuthRepo repo;

  CheckAuthenticationUseCase({@required this.repo});

  Future<Either<Failure, void>> call(NoParams params) => repo.checkAuthentication();
}