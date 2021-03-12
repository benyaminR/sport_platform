import 'package:flutter/cupertino.dart';
import 'package:sport_platform/features/courses/domain/enitity/video.dart';

class CourseVideoDataModel extends Video{

  CourseVideoDataModel({
    @required thumbnail,
    @required creationDate,
    @required source,
    @required viewCount
  }):
        super(thumbnail: thumbnail,
          creationDate: creationDate,
          source: source,
          viewCount: viewCount
      );

  factory CourseVideoDataModel.fromSnapshot(Map<String,dynamic> snapshot) => CourseVideoDataModel(
      thumbnail: snapshot['thumbnail'],
      creationDate: snapshot['creationDate'],
      source: snapshot['source'],
      viewCount: snapshot['viewCount']
  );

  static Map<String,dynamic> toMap(Video data)=> {
    'thumbnail':data.thumbnail,
    'source':data.source,
    'creationDate':data.creationDate,
    'viewCount':data.viewCount,
  };
}