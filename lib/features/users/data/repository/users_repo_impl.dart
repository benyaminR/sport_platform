import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:sport_platform/features/users/data/datasource/users_data_source.dart';
import 'package:sport_platform/features/users/domain/entity/user.dart';
import 'package:sport_platform/features/users/domain/repository/users_repo.dart';
import 'package:sport_platform/utils/criteria.dart';
import 'package:sport_platform/utils/error/exception.dart';
import 'package:sport_platform/utils/error/failure.dart';

@Singleton(as: UsersRepo)
class UsersRepoImpl extends UsersRepo{

  final UsersDataSource dataSource;

  UsersRepoImpl({@required this.dataSource});

  @override
  Future<Either<Failure, User>> addUser(User trainerData) async{
    try{
      return Right(await dataSource.addUser(trainerData));
    }on ServerException{
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<User>>> getUsers(Criteria criteriaData) async{
    try{
      return Right(await dataSource.getUsers(criteriaData));
    }on ServerException{
    return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, User>> removeUser(String username)async{
    try{
      return Right(await dataSource.removeUser(username));
    }on ServerException{
    return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, User>> updateUser(User trainerData) async{
    try{
      return Right(await dataSource.updateUser(trainerData));
    }on ServerException{
    return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> hasPurchasedCourse(String courseID) async{
    try{
      return Right(await dataSource.hasPurchasedCourse(courseID));
    }on ServerException{
    return Left(ServerFailure());
    }
  }

}