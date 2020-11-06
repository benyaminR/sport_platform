import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:sport_platform/features/courses/data/datamodel/course_data_model.dart';
import 'package:sport_platform/features/courses/data/datasource/courses_data_source.dart';
import 'package:sport_platform/features/courses/domain/enitity/course.dart';
import 'package:sport_platform/features/courses/domain/enitity/criteria.dart';
import 'package:sport_platform/features/courses/domain/repository/courses_repo.dart';
import 'package:sport_platform/utils/error/exception.dart';
import 'package:sport_platform/utils/error/failure.dart';

@Singleton(as: CoursesRepo)
class CoursesRepoImpl implements CoursesRepo{

  final CoursesDataSource dataSource;

  CoursesRepoImpl({@required this.dataSource});

  @override
  Future<Either<Failure, Course>> addCourse(Course course) async{
    try{
      var result = await dataSource.addCourse(CourseDataModel.fromCourse(course));
      return Right(result);
    } on ServerException{
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Course>> deleteCourse(String path)async {
    try{
      var result = await dataSource.deleteCourse(path);
      return Right(result);
    } on ServerException{
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<Course>>> getCourses(Criteria criteria)async {
    try{
      var result = await dataSource.getCourses(criteria);
      return Right(result);
    } on ServerException{
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Course>> updateCourse(Course course) async{
    try{
      var result = await dataSource.updateCourse(CourseDataModel.fromCourse(course));
      return Right(result);
    } on ServerException{
      return Left(ServerFailure());
    }
  }

}