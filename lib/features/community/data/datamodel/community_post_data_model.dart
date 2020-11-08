import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:sport_platform/features/community/data/datamodel/community_share_data_model.dart';
import 'package:sport_platform/features/community/domain/entity/community_post.dart';
import 'community_comment_datamodel.dart';
import 'community_like_data_model.dart';
import 'community_media_data_model.dart';

class CommunityPostDataModel extends CommunityPost{

  CommunityPostDataModel({@required description, @required date, @required media, @required UID, @required username, @required thumbnail, @required comments, @required likes, @required shares}):
  super(
          description:description,
          date:date,
          media:media,
          UID:UID,
          username:username,
          thumbnail:thumbnail,
          comments:comments,
          likes:likes,
          shares:shares,
      );

  static Map<String,dynamic> toMap(CommunityPostDataModel data) =>
      {
              'UID':data.UID,
              'description':data.description,
              'thumbnail':data.thumbnail,
              'username':data.username,
              'date':data.date,
              'comments':data.comments.map((e) => CommunityCommentDatamodel.toMap(e)).toList(),
              'shares':data.shares.map((e) => CommunityShareDataModel.toMap(e)).toList(),
              'likes':data.likes.map((e) => CommunityLikeDataModel.toMap(e)).toList(),
              'media':data.media.map((e) => CommunityMediaDataModel.toMap(e)).toList(),

      };

  factory CommunityPostDataModel.fromSnapshot(DocumentSnapshot snapshot) =>
      CommunityPostDataModel(
          description: snapshot.data()['description'],
          date: snapshot.data()['date'],
          UID: snapshot.data()['UID'],
          username: snapshot.data()['username'],
          thumbnail: snapshot.data()['thumbnail'],
          media: (snapshot.data()['media'] as List<dynamic>).map((e) => CommunityMediaDataModel.fromMap(e)).toList(),
          comments: (snapshot.data()['comments'] as List<dynamic>).map((e) => CommunityCommentDatamodel.fromMap(e)).toList(),
          likes: (snapshot.data()['likes'] as List<dynamic>).map((e) => CommunityLikeDataModel.fromMap(e)).toList(),
          shares: (snapshot.data()['shares'] as List<dynamic>).map((e) => CommunityShareDataModel.fromMap(e)).toList(),
      );

}