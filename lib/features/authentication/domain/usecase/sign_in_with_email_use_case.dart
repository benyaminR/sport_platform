import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:sport_platform/features/authentication/domain/entity/auth_data.dart';
import 'package:sport_platform/features/authentication/domain/repository/auth_repo.dart';
import 'package:sport_platform/utils/error/failure.dart';
import 'package:sport_platform/utils/usecases/params.dart';
import 'package:sport_platform/utils/usecases/usecase.dart';

@singleton
class SignInWithEmailUseCase extends UseCase<AuthData,WithParams>{

  final AuthRepo repo;

  SignInWithEmailUseCase({@required this.repo});

  @override
  Future<Either<Failure, AuthData>> call(WithParams params) => repo.signInWithEmail((params.param as List<Object>)[0],(params.param as List<Object>)[1]);
}