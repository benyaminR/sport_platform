import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:sport_platform/features/authentication/domain/entity/auth.dart';
import 'package:sport_platform/features/authentication/domain/repository/auth_repo.dart';
import 'package:sport_platform/utils/error/failure.dart';
import 'package:sport_platform/utils/usecases/no_params.dart';
import 'package:sport_platform/utils/usecases/params.dart';
import 'package:sport_platform/utils/usecases/usecase.dart';

@singleton
class SendPasswordRecoveryEmailUseCase extends UseCase<Auth,WithParams>{

  final AuthRepo repo;

  SendPasswordRecoveryEmailUseCase({@required this.repo});

  Future<Either<Failure, Auth>> call(WithParams params) => repo.sendPasswordRecoveryEmail((params.param as List<String>)[0]);
}