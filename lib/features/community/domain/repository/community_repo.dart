import 'dart:ui';

import 'package:dartz/dartz.dart';
import 'package:sport_platform/features/community/domain/entity/criteria.dart';
import 'package:sport_platform/features/community/domain/entity/post.dart';
import 'package:sport_platform/utils/error/failure.dart';

abstract class CommunityRepo{
  Future<Either<Failure, List<Post>>> getPosts(Criteria criteriaData);
  Future<Either<Failure, Post>> addPost(Post postData);
  Future<Either<Failure, Post>> removePost(Post postData);
  Future<Either<Failure, Post>> updatePost(Post postData);
}