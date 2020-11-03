import 'package:flutter/cupertino.dart';
import 'package:sport_platform/features/courses/domain/enitity/course_user.dart';

class CourseUserDataModel extends CourseUser{
  CourseUserDataModel({
    @required name,
    @required thumbnail,
    @required path
  }):
        super(
          name:name,
          thumbnail:thumbnail,
          path:path
      );

  factory CourseUserDataModel.fromSnapshot(Map<String,dynamic> data) => CourseUserDataModel(
      name: data['name'],
      thumbnail: data['thumbnail'],
      path: data['path']
  );


}