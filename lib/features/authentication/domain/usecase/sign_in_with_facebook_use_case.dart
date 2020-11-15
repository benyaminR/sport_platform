import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:sport_platform/features/authentication/domain/entity/auth.dart';
import 'package:sport_platform/features/authentication/domain/repository/auth_repo.dart';
import 'package:sport_platform/utils/error/failure.dart';
import 'package:sport_platform/utils/usecases/no_params.dart';
import 'package:sport_platform/utils/usecases/usecase.dart';

@singleton
class SignInWithFacebookUseCase extends UseCase<Auth,NoParams>{

  final AuthRepo repo;

  SignInWithFacebookUseCase({@required this.repo});

  @override
  Future<Either<Failure, Auth>> call(params) => repo.signInWithFacebook();

}