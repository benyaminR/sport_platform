import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:sport_platform/archive/community/domain/entity/community_share.dart';

class CommunityShareDataModel extends CommunityShare{

  CommunityShareDataModel({@required date,@required username, @required thumbnail, }):
  super(
          date:date,
          username:username,
          thumbnail:thumbnail,
      );
  static Map<String,dynamic> toMap(CommunityShare data)=>{
    'date':data.date,
    'username':data.username,
    'thumbnail':data.thumbnail,
  };

  factory CommunityShareDataModel.fromMap(Map<String,dynamic> data) => CommunityShareDataModel(
    thumbnail: data['thumbnail'],
    date: data['date'],
    username:data['username']
  );
}