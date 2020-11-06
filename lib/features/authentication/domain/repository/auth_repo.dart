import 'package:dartz/dartz.dart';
import 'package:sport_platform/features/authentication/domain/entity/auth.dart';
import 'package:sport_platform/utils/error/failure.dart';

abstract class AuthRepo{
  Future<Either<Failure,Auth>> signInAnonymously();
  Future<Either<Failure,Auth>> signInWithGoogle();
  Future<Either<Failure,Auth>> signInWithApple();
  Future<Either<Failure,Auth>> signInWithEmail(String email,String password);
  Future<Either<Failure,Auth>> signInWithFacebook();
  Future<Either<Failure,Auth>> checkAuthentication();
}