import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:sport_platform/features/community/domain/entity/community_media.dart';

class CommunityMediaDataModel extends CommunityMedia{


  CommunityMediaDataModel({@required thumbnail, @required viewCount, @required source, @required creationDate, @required mediaType})
  : super(
      thumbnail:thumbnail,
      viewCount:viewCount,
      source:source,
      creationDate:creationDate,
      mediaType:mediaType,
  );

  static Map<String,dynamic> toMap(CommunityMedia data) => {
    'thumbnail':data.thumbnail,
    'viewCount':data.viewCount,
    'creationDate':data.creationDate,
    'source':data.source,
    'mediaType':data.mediaType,
  };

  factory CommunityMediaDataModel.fromMap(Map<String,dynamic> data)=> CommunityMediaDataModel(
    thumbnail: data['thumbnail'],
    viewCount: data['viewCount'],
    source: data['source'],
    creationDate: data['creationDate'],
    mediaType:data['mediaType']
  );

}