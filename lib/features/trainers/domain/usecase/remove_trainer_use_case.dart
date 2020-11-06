import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:sport_platform/features/trainers/domain/entity/trainer.dart';
import 'package:sport_platform/features/trainers/domain/repository/trainers_repo.dart';
import 'package:sport_platform/utils/error/failure.dart';
import 'package:sport_platform/utils/usecases/params.dart';
import 'package:sport_platform/utils/usecases/usecase.dart';

@singleton
class RemoveTrainerUseCase extends UseCase<Trainer,WithParams>{

  final TrainersRepo repo;

  RemoveTrainerUseCase({@required this.repo});

  @override
  Future<Either<Failure, Trainer>> call(WithParams params) => repo.removeTrainer(params.param);
}