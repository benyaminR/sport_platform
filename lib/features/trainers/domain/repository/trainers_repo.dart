import 'dart:ui';

import 'package:dartz/dartz.dart';
import 'package:sport_platform/features/community/domain/entity/criteria.dart';
import 'package:sport_platform/features/trainers/domain/entity/trainer.dart';
import 'package:sport_platform/utils/error/failure.dart';

abstract class TrainersRepo{
  Future<Either<Failure, List<Trainer>>> getTrainers(Criteria criteriaData);
  Future<Either<Failure, Trainer>> addTrainer(Trainer trainerData);
  Future<Either<Failure, Trainer>> removeTrainer(String uid);
  Future<Either<Failure, Trainer>> updateTrainer(Trainer trainerData);
}