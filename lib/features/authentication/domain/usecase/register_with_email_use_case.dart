import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:sport_platform/features/authentication/domain/entity/auth.dart';
import 'package:sport_platform/features/authentication/domain/repository/auth_repo.dart';
import 'package:sport_platform/utils/error/failure.dart';
import 'package:sport_platform/utils/usecases/params.dart';
import 'package:sport_platform/utils/usecases/usecase.dart';

@singleton
class RegisterWithEmailUseCase extends UseCase<Auth,WithParams>{

  final AuthRepo repo;

  RegisterWithEmailUseCase({@required this.repo});

  Future<Either<Failure, Auth>> call(WithParams params) => repo.registerWithEmail((params.param as List<String>)[0],(params.param as List<String>)[1]);
}