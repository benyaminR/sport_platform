import 'package:flutter/cupertino.dart';
import 'package:sport_platform/features/courses/domain/enitity/video.dart';

class CourseVideoDataModel extends Video{

  CourseVideoDataModel({
    @required thumbnail,
    @required source,
    @required title,
    @required description
  }):
        super(thumbnail: thumbnail,
          title: title,
          source: source,
          description: description
      );

  factory CourseVideoDataModel.fromSnapshot(Map<String,dynamic> snapshot) => CourseVideoDataModel(
      thumbnail: snapshot['thumbnail'],
      source: snapshot['source'],
      description:snapshot['description'] ,
      title: snapshot['title'],
  );

  static Map<String,dynamic> toMap(Video data)=> {
    'thumbnail':data.thumbnail,
    'source':data.source,
    'title':data.title,
    'description':data.description
  };
}