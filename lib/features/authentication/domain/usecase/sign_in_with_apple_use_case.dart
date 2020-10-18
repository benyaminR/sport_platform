

import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:sport_platform/features/authentication/domain/entity/auth_data.dart';
import 'package:sport_platform/features/authentication/domain/repository/auth_repo.dart';
import 'package:sport_platform/utils/error/failure.dart';
import 'package:sport_platform/utils/usecases/no_params.dart';
import 'package:sport_platform/utils/usecases/usecase.dart';

class SignInWithAppleUseCase extends UseCase<AuthData,NoParams>{

  final AuthRepo repo;

  SignInWithAppleUseCase({@required this.repo});

  @override
  Future<Either<Failure, AuthData>> call(NoParams params) => repo.signInWithApple();
}