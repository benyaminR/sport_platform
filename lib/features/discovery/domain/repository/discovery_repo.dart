
import 'package:dartz/dartz.dart';
import 'package:sport_platform/features/discovery/domain/entity/discovery.dart';
import 'package:sport_platform/utils/error/failure.dart';

abstract class DiscoveryRepo{
  Future<Either<Failure,DiscoveryData>> getDiscoveryData();
}