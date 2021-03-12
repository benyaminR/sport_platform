import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:sport_platform/features/community/data/datamodel/community_comment_datamodel.dart';
import 'package:sport_platform/features/community/data/datamodel/community_post_data_model.dart';
import 'package:sport_platform/features/community/domain/entity/community_comment.dart';
import 'package:sport_platform/features/community/domain/entity/community_post.dart';
import 'package:sport_platform/utils/criteria.dart';
import 'package:sport_platform/utils/error/exception.dart';
import 'package:sport_platform/utils/error/failure.dart';

abstract class CommunityDataSource{
  Future<List<CommunityPostDataModel>> getPosts(Criteria criteriaData);
  Future<CommunityPostDataModel> addPost(CommunityPost postData);
  Future<CommunityPostDataModel> removePost(CommunityPost postData);
  Future<CommunityPostDataModel> updatePost(CommunityPost postData);
  Future<CommunityCommentDatamodel> commentPost(CommunityComment comment);
  Future<void> like(String postID);
}

@Singleton(as: CommunityDataSource)
class CommunityDataSourceImpl implements CommunityDataSource{

  final FirebaseFirestore firebaseFirestore;
  final FirebaseFunctions functions;
  CommunityDataSourceImpl({@required this.functions, @required this.firebaseFirestore});

  @override
  Future<CommunityPostDataModel> addPost(CommunityPost postData) async{
    try {
      await functions
          .httpsCallable("addCommunityPost")
          .call(
            CommunityPostDataModel.toMap(postData)
      );
      return Future.value(CommunityPostDataModel.fromCommunityPost(postData));
    } on Exception{
      throw ServerException();
    }
  }

  @override
  Future<List<CommunityPostDataModel>> getPosts(Criteria criteriaData) async{
    try {
      if(criteriaData != null) {
        var res = await firebaseFirestore.collection('Community').where(
            criteriaData.field, isEqualTo: criteriaData).get();
        return res.docs.map((e) => CommunityPostDataModel.fromSnapshot(e)).toList();
      }
      else{
        var res = await firebaseFirestore.collection('Community').get();
        return res.docs.map((e) => CommunityPostDataModel.fromSnapshot(e)).toList();
      }
    } on Exception{
      throw ServerFailure();
    }
  }

  @override
  Future<CommunityPostDataModel> removePost(CommunityPost postData) async{
    try {
      await firebaseFirestore.collection('Community').doc(postData.docID).delete();
      return Future.value(CommunityPostDataModel.fromCommunityPost(postData));
    } on Exception{
      throw ServerFailure();
    }
  }

  @override
  Future<CommunityPostDataModel> updatePost(CommunityPost postData) async {
    try {
      await firebaseFirestore.collection('Community').doc(postData.docID).update(CommunityPostDataModel.toMap(postData));
      return Future.value(CommunityPostDataModel.fromCommunityPost(postData));
    } on Exception{
      throw ServerFailure();
    }
  }

  @override
  Future<CommunityCommentDatamodel> commentPost(CommunityComment comment) async{
    try {
      var commentMap = CommunityCommentDatamodel.toMap(comment);
      var commentFunction = functions.httpsCallable('commentCommunityPost');
      commentFunction.call(commentMap);
      return Future.value(CommunityCommentDatamodel.fromMap(commentMap));
    } on Exception{
      throw ServerFailure();
    }
  }

  @override
  Future<void> like(String postID) async{
    try {
      await functions.httpsCallable('likePost').call({'postID':postID});
      return Future.value();
    } on Exception{
      throw ServerFailure();
    }
  }

}