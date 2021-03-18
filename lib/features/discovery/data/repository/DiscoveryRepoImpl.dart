import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:sport_platform/features/discovery/data/datasource/discovery_data_source.dart';
import 'package:sport_platform/features/discovery/domain/entity/discovery.dart';
import 'package:sport_platform/features/discovery/domain/repository/discovery_repo.dart';
import 'package:sport_platform/utils/error/exception.dart';
import 'package:sport_platform/utils/error/failure.dart';

@Singleton(as: DiscoveryRepo)
class DiscoveryRepoImpl implements DiscoveryRepo{
  final DiscoveryDataSource ds;
  DiscoveryRepoImpl({@required this.ds});

  @override
  Future<Either<Failure, DiscoveryData>> getDiscoveryData() async{
    try {
      return Right( await ds.getDiscovery());
    }  on ServerException{
      return Left(ServerFailure());
    }
  }

}