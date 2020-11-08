import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:sport_platform/features/community/data/datamodel/community_criteria_data_model.dart';
import 'package:sport_platform/features/community/data/datamodel/community_post_data_model.dart';

abstract class CommunityDataSource{
  Future<List<CommunityPostDataModel>> getPosts(CommunityCriteriaDataModel criteriaData);
  Future<CommunityPostDataModel> addPost(CommunityPostDataModel postData);
  Future<CommunityPostDataModel> removePost(CommunityPostDataModel postData);
  Future<CommunityPostDataModel> updatePost(CommunityPostDataModel postData);
}

class CommunityDataSourceImpl implements CommunityDataSource{
  final FirebaseFirestore firebaseFirestore;

  CommunityDataSourceImpl({@required this.firebaseFirestore});


  @override
  Future<CommunityPostDataModel> addPost(CommunityPostDataModel postData) async{
    await firebaseFirestore.collection('Community').doc().set(CommunityPostDataModel.toMap(postData));
    return postData;
  }

  @override
  Future<List<CommunityPostDataModel>> getPosts(CommunityCriteriaDataModel criteriaData) async{
    if(criteriaData != null) {
      var res = await firebaseFirestore.collection('Community').where(
          criteriaData.filter, isEqualTo: criteriaData).get();
      return res.docs.map((e) => CommunityPostDataModel.fromSnapshot(e)).toList();
    }
    else{
      var res = await firebaseFirestore.collection('Community').get();
      return res.docs.map((e) => CommunityPostDataModel.fromSnapshot(e)).toList();
    }
  }

  @override
  Future<CommunityPostDataModel> removePost(CommunityPostDataModel postData) async{
    await firebaseFirestore.collection('Community').doc(postData.UID).delete();
    return postData;
  }

  @override
  Future<CommunityPostDataModel> updatePost(CommunityPostDataModel postData) async {
    await firebaseFirestore.collection('Community').doc(postData.UID).update(CommunityPostDataModel.toMap(postData));
    return postData;
  }

}