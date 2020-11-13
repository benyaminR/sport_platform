import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:sport_platform/features/community/domain/entity/community_criteria.dart';
import 'package:sport_platform/features/users_feature/domain/entity/user.dart';
import 'package:sport_platform/features/users_feature/domain/repository/users_repo.dart';
import 'package:sport_platform/utils/error/exception.dart';
import 'package:sport_platform/utils/error/failure.dart';
import 'package:sport_platform/features/users_feature/data/datasource/users_data_source.dart';
class UsersRepoImpl implements UsersRepo{

  final UsersDataSource dataSource;
  UsersRepoImpl({@required this.dataSource});

  @override
  Future<Either<Failure, User>> addUser(User userData) async {
    try{
      return Right(await dataSource.addUser(userData));
    }on ServerException{
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<User>>> getUsers(CommunityCriteria criteriaData) async{
    try{
      return Right(await dataSource.getUsers(criteriaData));
    }on ServerException{
    return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, User>> removeUser(String username) async{
    try{
      return Right(await dataSource.removeUser(username));
    }on ServerException{
    return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, User>> updateUser(User userData) async{
    try{
      return Right(await dataSource.updateUser(userData));
    }on ServerException{
    return Left(ServerFailure());
    }
  }

}