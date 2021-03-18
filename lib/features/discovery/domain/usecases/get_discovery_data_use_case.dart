import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:sport_platform/features/discovery/domain/entity/discovery.dart';
import 'package:sport_platform/features/discovery/domain/repository/discovery_repo.dart';
import 'package:sport_platform/utils/error/failure.dart';
import 'package:sport_platform/utils/usecases/no_params.dart';
import 'package:sport_platform/utils/usecases/usecase.dart';

@singleton
class GetDiscoveryDataUseCase extends UseCase<DiscoveryData,NoParams>{

  final DiscoveryRepo repo;

  GetDiscoveryDataUseCase({@required this.repo});

  @override
  Future<Either<Failure, DiscoveryData>> call(NoParams params) => repo.getDiscoveryData();
}