import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:sport_platform/features/courses/data/datamodel/course_comment_data_model.dart';
import 'package:sport_platform/features/courses/data/datamodel/course_content_section_data_model.dart';
import 'package:sport_platform/features/courses/data/datamodel/course_trainer_data_model.dart';
import 'package:sport_platform/features/courses/data/datamodel/course_user_data_model.dart';
import 'package:sport_platform/features/courses/domain/enitity/course.dart';

class CourseDataModel extends Course{

  CourseDataModel({@required date,
    @required title,
    @required comments,
    @required trainer,
    @required description,
    @required content,
    @required students,
    @required category,
    @required path
  })
      : super(
    date:date,
    title:title,
    comments:comments,
    trainer:trainer,
    description:description,
    content:content,
    students:students,
    category:category,
    path:path,
  );


  factory CourseDataModel.fromSnapshot(DocumentSnapshot snapshot) {
    var data = snapshot.data();
    return CourseDataModel(
      date: data['date'],
      title: data['title'],
      comments: (data['comments'] as List<dynamic>).map((e)=>CourseCommentDataModel.fromMap(e)).toList(),
      trainer: CourseTrainerDataModel.fromSnapShot(snapshot),
      description: data['description'],
      content: (data['content'] as List<dynamic>).map((e) => CourseContentSectionDataModel.fromMap(e)).toList(),
      students: (data['students'] as List<dynamic>).map((e) => CourseUserDataModel.fromSnapshot(e)).toList(),
      category: data['category'],
      path: snapshot.reference.path
  );
  }

  factory CourseDataModel.fromCourse(Course course) => CourseDataModel(
      date: course.date,
      title: course.title,
      comments: course.comments,
      trainer: course.trainer,
      description: course.description,
      content: course.content,
      students: course.students,
      category: course.category,
      path: course.path
  );

  static Map<String,dynamic> toMap(CourseDataModel courseDataModel) => {
      'date': DateTime.now().toString(),
      'title': courseDataModel.title,
      'comments': courseDataModel.comments,
      'trainer': {
        'name': courseDataModel.trainer.name,
        'thumbnail': courseDataModel.trainer.thumbnail,
        'path': courseDataModel.trainer.path
      },
      'description': courseDataModel.description,
      'content': courseDataModel.content,
      'students': courseDataModel.students,
      'category': courseDataModel.category,
      'path': courseDataModel.path
  };
}