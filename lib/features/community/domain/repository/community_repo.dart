
import 'package:dartz/dartz.dart';
import 'package:sport_platform/features/community/domain/entity/community_post.dart';
import 'package:sport_platform/utils/criteria.dart';
import 'package:sport_platform/utils/error/failure.dart';

abstract class CommunityRepo{
  Future<Either<Failure, List<CommunityPost>>> getPosts(Criteria criteriaData);
  Future<Either<Failure, CommunityPost>> addPost(CommunityPost postData);
  Future<Either<Failure, CommunityPost>> removePost(CommunityPost postData);
  Future<Either<Failure, CommunityPost>> updatePost(CommunityPost postData);
}