import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:sport_platform/features/courses/domain/enitity/comment.dart';
import 'package:sport_platform/features/courses/domain/enitity/course_trainer.dart';
import 'content_section.dart';
import 'course_user.dart';

class Course extends Equatable{
  final String date;
  final String title;
  final List<Comment> comments;
  final CourseTrainer trainer;
  final String description;
  final List<ContentSection> content;
  final List<CourseUser> students;
  final String category;
  final String path;

  Course({
    @required this.date,
    @required this.title,
    @required this.comments,
    @required this.trainer,
    @required this.description,
    @required this.content,
    @required this.students,
    @required this.category,
    @required this.path
  });

  @override
  List<Object> get props => [date, title, comments, trainer, description, content, students, category, path];
}