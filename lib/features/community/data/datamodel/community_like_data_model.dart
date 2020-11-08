import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:sport_platform/features/community/domain/entity/community_like.dart';

class CommunityLikeDataModel extends CommunityLike{


  CommunityLikeDataModel({@required date, @required username, @required thumbnail, }) : super(
      date:date,
      username:username,
      thumbnail:thumbnail,
  );


  static Map<String,dynamic> toMap(CommunityLikeDataModel data) => {
    'date':data.date,
    'username':data.username,
    'thumbnail':data.thumbnail,
  };

  factory CommunityLikeDataModel.fromMap(Map<String,dynamic> data) =>  CommunityLikeDataModel(
    thumbnail: data['thumbnail'],
    date: data['date'],
    username:data['username'],
  );

}