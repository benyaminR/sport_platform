import 'package:dartz/dartz.dart';
import 'package:sport_platform/features/authentication/domain/entity/auth_data.dart';
import 'package:sport_platform/utils/error/failure.dart';

abstract class AuthRepo{
  Future<Either<Failure,AuthData>> signInAnonymously();
  Future<Either<Failure,AuthData>> signInWithGoogle();
  Future<Either<Failure,AuthData>> signInWithApple();
  Future<Either<Failure,AuthData>> signInWithEmail(String email,String password);
  Future<Either<Failure,AuthData>> signInWithFacebook();
}