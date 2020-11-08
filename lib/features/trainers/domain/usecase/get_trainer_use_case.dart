import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:sport_platform/features/community/domain/entity/community_criteria.dart';
import 'package:sport_platform/features/trainers/domain/entity/trainer.dart';
import 'package:sport_platform/features/trainers/domain/repository/trainers_repo.dart';
import 'package:sport_platform/utils/error/failure.dart';
import 'package:sport_platform/utils/usecases/params.dart';
import 'package:sport_platform/utils/usecases/usecase.dart';

class GetTrainersUseCase extends UseCase<List<Trainer>,WithParams>{

  final TrainersRepo repo;

  GetTrainersUseCase({@required this.repo});


  @override
  Future<Either<Failure, List<Trainer>>> call(WithParams params) => repo.getTrainers(params.param);
}