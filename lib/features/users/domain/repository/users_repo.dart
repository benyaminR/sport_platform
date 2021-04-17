import 'package:dartz/dartz.dart';
import 'package:sport_platform/features/users/domain/entity/user.dart';
import 'package:sport_platform/utils/criteria.dart';
import 'package:sport_platform/utils/error/failure.dart';

abstract class UsersRepo{
  Future<Either<Failure, List<User>>> getUsers(Criteria criteria);
  Future<Either<Failure, User>> addUser(User user);
  Future<Either<Failure, User>> removeUser(String username);
  Future<Either<Failure, User>> updateUser(User user);
  Future<Either<Failure, bool>> hasPurchasedCourse(String courseID);
  Future<Either<Failure, User>> getUser(String userID);

}