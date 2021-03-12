import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:sport_platform/features/courses/domain/enitity/course.dart';
import 'package:sport_platform/features/courses/domain/repository/courses_repo.dart';
import 'package:sport_platform/utils/error/failure.dart';
import 'package:sport_platform/utils/usecases/params.dart';
import 'package:sport_platform/utils/usecases/usecase.dart';

@singleton
class AddCourseUseCase extends UseCase<Course,WithParams>{

  final CoursesRepo repo;

  AddCourseUseCase({@required this.repo});

  @override
  Future<Either<Failure, Course>> call(WithParams params) => repo.addCourse(params.param as Course);
}