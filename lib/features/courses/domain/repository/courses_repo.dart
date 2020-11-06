import 'package:dartz/dartz.dart';
import 'package:sport_platform/features/courses/domain/enitity/course.dart';
import 'package:sport_platform/features/courses/domain/enitity/criteria.dart';
import 'package:sport_platform/utils/error/failure.dart';

abstract class CoursesRepo{
  Future<Either<Failure,Course>> deleteCourse(String path);
  Future<Either<Failure,Course>> addCourse(Course course);
  Future<Either<Failure,Course>> updateCourse(Course course);
  Future<Either<Failure, List<Course>>> getCourses(Criteria criteria);
}