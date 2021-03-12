import 'package:flutter/cupertino.dart';
import 'package:sport_platform/features/courses/domain/enitity/comment.dart';

class CourseCommentDataModel extends Comment{
  CourseCommentDataModel({
    @required username,
    @required  thumbnail,
    @required  stars,
    @required  text,
    @required  date
  }) :
        super(
          username:username,
          thumbnail:thumbnail,
          stars:stars,
          text:text,
          date:date
      );

  factory CourseCommentDataModel.fromMap(Map<String,dynamic> data) =>
      CourseCommentDataModel(
          username: data['username'],
          thumbnail: data['thumbnail'],
          stars: data['stars'],
          text: data['text'],
          date: data['date']
      );

  static Map<String,dynamic> toMap(Comment commentDataModel)=> {
    'text':commentDataModel.text,
    'date':commentDataModel.date,
    'thumbnail':commentDataModel.thumbnail,
    'stars':commentDataModel.stars,
    'username':commentDataModel.username
  };
}