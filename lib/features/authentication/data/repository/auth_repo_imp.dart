
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:sport_platform/features/authentication/data/datamodel/auth_data_model.dart';
import 'package:sport_platform/features/authentication/data/datasource/auth_remote_data_source.dart';
import 'package:sport_platform/features/authentication/domain/entity/auth.dart';
import 'package:sport_platform/features/authentication/domain/repository/auth_repo.dart';
import 'package:sport_platform/utils/error/exception.dart';
import 'package:sport_platform/utils/error/failure.dart';

@Singleton(as: AuthRepo)
class AuthRepoImp implements AuthRepo{
  final AuthRemoteDataSource dataSource;

  AuthRepoImp({@required this.dataSource});


  @override
  Future<Either<Failure, Auth>> signInWithEmail(String email,String password) async{
    try{
      var res = await dataSource.signInWithEmail(email, password);
      return Right(res);
    } on ServerException{
      return Left(ServerFailure());
    }  }


  @override
  Future<Either<Failure, Auth>> signInWithGoogle() async{
    try{
      var res = await dataSource.signInWithGoogle();
      return Right(res);
    } on ServerException{
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Auth>> checkAuthentication() async {
    try{
      var res = await dataSource.checkAuthentication();
      return Right(AuthDatamodel(userCredential: null));
    } on ServerException{
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Auth>> registerWithEmail(String email, String password) async {
    try{
      var res = await dataSource.registerWithEmail(email,password);
      return Right(res);
    } on ServerException{
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Auth>> sendPasswordRecoveryEmail(String email) async{
    try{
      var res = await dataSource.sendPasswordRecoveryEmail(email);
      return Right(res);
    } on ServerException{
      return Left(ServerFailure());
    }
  }



}