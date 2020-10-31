import 'dart:ui';

import 'package:dartz/dartz.dart';
import 'package:sport_platform/features/authentication/domain/entity/course_data.dart';
import 'package:sport_platform/features/authentication/domain/entity/criteria_data.dart';
import 'package:sport_platform/utils/error/failure.dart';

abstract class CoursesRepo{
  Future<Either<Failure,CourseData>> deleteCourse(Path path);
  Future<Either<Failure,CourseData>> addCourse(CourseData courseData);
  Future<Either<Failure,CourseData>> updateCourse(CourseData courseData);
  Future<Either<Failure, List<CourseData>>> getCourses(CriteriaData criteriaData);
}