import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:sport_platform/features/community/domain/entity/community_comment.dart';

class CommunityCommentDatamodel extends CommunityComment{

  CommunityCommentDatamodel({@required username, @required thumbnail, @required postID, @required text, @required date})
      : super(
    username:username,
    thumbnail:thumbnail,
    postID:postID,
    text:text,
    date:date,
  );


  static Map<String,dynamic> toMap(CommunityComment data) => {
    'date':data.date,
    'username':data.username,
    'thumbnail':data.thumbnail,
    'postID':data.postID,
    'text':data.text,
  };

  factory CommunityCommentDatamodel.fromMap(Map<String,dynamic> data) => CommunityCommentDatamodel(
    date:data['date'] ,
    thumbnail: data['thumbnail'],
    postID: data['postID'],
    text: data['text'],
    username:data['username']
  );
}