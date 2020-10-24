
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:sport_platform/features/authentication/data/datasource/auth_remote_data_source.dart';
import 'package:sport_platform/features/authentication/domain/entity/auth_data.dart';
import 'package:sport_platform/features/authentication/domain/repository/auth_repo.dart';
import 'package:sport_platform/utils/error/exception.dart';
import 'package:sport_platform/utils/error/failure.dart';

@Singleton(as: AuthRepo)
class AuthRepoImp implements AuthRepo{
  final AuthRemoteDataSource dataSource;

  AuthRepoImp({@required this.dataSource});

  @override
  Future<Either<Failure, AuthData>> signInAnonymously() async{
    try{
      var res = await dataSource.signInAnonymously();
      return Right(res);
    } on ServerException{
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, AuthData>> signInWithApple() {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, AuthData>> signInWithEmail(String email,String password) async{
    try{
      var res = await dataSource.signInWithEmail(email, password);
      return Right(res);
    } on ServerException{
      return Left(ServerFailure());
    }  }

  @override
  Future<Either<Failure, AuthData>> signInWithFacebook() async{
    try{
      var res = await dataSource.signInWithFacebook();
      return Right(res);
    } on ServerException{
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, AuthData>> signInWithGoogle() async{
    try{
      var res = await dataSource.signInWithGoogle();
      return Right(res);
    } on ServerException{
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, AuthData>> checkAuthentication() async {
    try{
      var res = await dataSource.checkAuthentication();
      return Right(res);
    } on ServerException{
      return Left(ServerFailure());
    }
  }



}