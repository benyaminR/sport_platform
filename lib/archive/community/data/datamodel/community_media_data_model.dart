import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:sport_platform/archive/community/domain/entity/community_media.dart';

class CommunityMediaDataModel extends CommunityMedia{


  CommunityMediaDataModel({@required source,@required mediaType})
  : super(
      source:source,
      mediaType:mediaType,
  );

  static Map<String,dynamic> toMap(CommunityMedia data) => {
    'source':data.source,
    'mediaType':data.mediaType,
  };

  factory CommunityMediaDataModel.fromMap(Map<String,dynamic> data){
    return CommunityMediaDataModel(
    source: data['source'],
    mediaType:data['mediaType']
  );
  }

}