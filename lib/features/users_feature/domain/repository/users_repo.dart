import 'dart:ui';

import 'package:dartz/dartz.dart';
import 'package:sport_platform/features/community/domain/entity/criteria.dart';
import 'package:sport_platform/features/community/domain/entity/post.dart';
import 'package:sport_platform/features/users_feature/domain/entity/user.dart';
import 'package:sport_platform/utils/error/failure.dart';

abstract class UsersRepo{
  Future<Either<Failure, List<User>>> getUsers(Criteria criteriaData);
  Future<Either<Failure, User>> addUser(User userData);
  Future<Either<Failure, User>> removeUser(String uid);
  Future<Either<Failure, User>> updateUser(User userData);
}