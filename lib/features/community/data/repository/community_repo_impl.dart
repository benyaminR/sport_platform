import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:sport_platform/features/community/data/datasource/community_data_source.dart';
import 'package:sport_platform/features/community/domain/entity/community_comment.dart';
import 'package:sport_platform/features/community/domain/entity/community_post.dart';
import 'package:sport_platform/features/community/domain/repository/community_repo.dart';
import 'package:sport_platform/utils/criteria.dart';
import 'package:sport_platform/utils/error/exception.dart';
import 'package:sport_platform/utils/error/failure.dart';


@Singleton(as:CommunityRepo)
class CommunityRepoImpl extends CommunityRepo{
  final CommunityDataSource datasource;

  CommunityRepoImpl({@required this.datasource});


  @override
  Future<Either<Failure, CommunityPost>> addPost(CommunityPost postData) async{
    try{
      var post = await datasource.addPost(postData);
      return Right(post);
    }on ServerException{
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<CommunityPost>>> getPosts(Criteria criteriaData) async{
    try{
      var posts = await datasource.getPosts(criteriaData);
      return Right(posts);
    }on ServerException{
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, CommunityPost>> removePost(CommunityPost postData) async{
    try{
      var post = await datasource.removePost(postData);
      return Right(post);
    }on ServerException{
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, CommunityPost>> updatePost(CommunityPost postData) async{
    try{
      var post = await datasource.updatePost(postData);
      return Right(post);
    }on ServerException{
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, CommunityComment>> commentPost(CommunityComment comment) async{
    try{
      var post = await datasource.commentPost(comment);
      return Right(post);
    }on ServerException{
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> like(String postID) async {
    try{
      var post = await datasource.like(postID);
      return Right(null);
    }on ServerException{
      return Left(ServerFailure());
    }
  }

}