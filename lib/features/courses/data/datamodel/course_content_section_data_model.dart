import 'package:flutter/cupertino.dart';
import 'package:sport_platform/features/courses/data/datamodel/course_video_data_model.dart';
import 'package:sport_platform/features/courses/domain/enitity/content_section.dart';

class CourseContentSectionDataModel extends ContentSectionData {
  CourseContentSectionDataModel({
    @required description,
    @required videos
  }) :
        super(
          description: description,
          videos: videos
      );

  factory CourseContentSectionDataModel.fromMap(Map<String, dynamic> data) =>
      CourseContentSectionDataModel(
          description: data['description'],
          videos: (data['videos'] as List<dynamic>).map((e) =>
              CourseVideoDataModel.fromSnapshot(e)).toList()
      );

  static Map<String, dynamic> toMap(ContentSectionData data) => {
    'description':data.description,
    'videos': data.videos.map((e) => CourseVideoDataModel.toMap(e)).toList()
  };
}