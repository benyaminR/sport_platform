import 'package:dartz/dartz.dart';
import 'package:sport_platform/utils/error/failure.dart';

abstract class UseCase<Type,Params>{
  Future<Either<Failure,Type>> call(Params params);
}