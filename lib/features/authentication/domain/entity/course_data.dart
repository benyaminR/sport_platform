import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import 'content_section_data.dart';

class CourseData extends Equatable{
  final String date;
  final String title;
  final List<Review> reviews;
  final Trainer trainer;
  final String description;
  final List<ContentSectionData> content;
  final List<User> students;
  final Category category;
  final String path;

  CourseData({@required this.date, this.title, this.reviews, this.trainer, this.description, this.content, this.students, this.category, this.path});
  @override
  List<Object> get props => [date, title, reviews, trainer, description, content, students, category, path];
}