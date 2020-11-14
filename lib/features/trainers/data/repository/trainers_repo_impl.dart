import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:sport_platform/features/community/domain/entity/community_criteria.dart';
import 'package:sport_platform/features/trainers/data/datasource/trainers_data_source.dart';
import 'package:sport_platform/features/trainers/domain/entity/trainer.dart';
import 'package:sport_platform/features/trainers/domain/entity/trainer_criteria.dart';
import 'package:sport_platform/features/trainers/domain/repository/trainers_repo.dart';
import 'package:sport_platform/utils/error/exception.dart';
import 'package:sport_platform/utils/error/failure.dart';

class TrainersRepoImpl extends TrainersRepo{

  final TrainersDataSource dataSource;

  TrainersRepoImpl({@required this.dataSource});

  @override
  Future<Either<Failure, Trainer>> addTrainer(Trainer trainerData) async{
    try{
      return Right(await dataSource.addTrainer(trainerData));
    }on ServerException{
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<Trainer>>> getTrainers(TrainerCriteria criteriaData) async{
    try{
      return Right(await dataSource.getTrainers(criteriaData));
    }on ServerException{
    return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Trainer>> removeTrainer(String username)async{
    try{
      return Right(await dataSource.removeTrainer(username));
    }on ServerException{
    return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Trainer>> updateTrainer(Trainer trainerData) async{
    try{
      return Right(await dataSource.updateTrainer(trainerData));
    }on ServerException{
    return Left(ServerFailure());
    }
  }

}