import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:sport_platform/features/community/data/datamodel/community_share_data_model.dart';
import 'package:sport_platform/features/community/domain/entity/community_post.dart';
import 'community_comment_datamodel.dart';
import 'community_like_data_model.dart';
import 'community_media_data_model.dart';

class CommunityPostDataModel extends CommunityPost{

  CommunityPostDataModel({@required description, @required date, @required media, @required username, @required thumbnail, @required comments, @required likes, @required shares, @required docID}):
  super(
          description:description,
          date:date,
          media:media,
          username:username,
          thumbnail:thumbnail,
          comments:comments,
          likes:likes,
          shares:shares,
          docID:docID
      );

  static Map<String,dynamic> toMap(CommunityPost data) =>
      {
              'description':data.description,
              'thumbnail':data.thumbnail,
              'username':data.username,
              'date':data.date,
              'comments':data.comments.map((e) => CommunityCommentDatamodel.toMap(e)).toList(),
              'shares':data.shares.map((e) => CommunityShareDataModel.toMap(e)).toList(),
              'likes':data.likes.map((e) => CommunityLikeDataModel.toMap(e)).toList(),
              'media':data.media.map((e) => CommunityMediaDataModel.toMap(e)).toList(),
              'path':data.docID

      };

  factory CommunityPostDataModel.fromCommunityPost(CommunityPost post)=>
      CommunityPostDataModel(
          description: post.description,
          date: post.date,
          media: post.media,
          username: post.username,
          thumbnail: post.thumbnail,
          comments: post.comments,
          likes: post.likes,
          shares: post.shares,
          docID: post.docID
      );

  factory CommunityPostDataModel.fromSnapshot(DocumentSnapshot snapshot) =>
      CommunityPostDataModel(
          description: snapshot.data()['description'],
          date: snapshot.data()['date'],
          username: snapshot.data()['username'],
          thumbnail: snapshot.data()['thumbnail'],
          media: (snapshot.data()['media'] as List<dynamic>).map((e) => CommunityMediaDataModel.fromMap(e)).toList(),
          comments: (snapshot.data()['comments'] as List<dynamic>).map((e) => CommunityCommentDatamodel.fromMap(e)).toList(),
          likes: (snapshot.data()['likes'] as List<dynamic>).map((e) => CommunityLikeDataModel.fromMap(e)).toList(),
          shares: (snapshot.data()['shares'] as List<dynamic>).map((e) => CommunityShareDataModel.fromMap(e)).toList(),
          docID:snapshot.reference.id
      );


}