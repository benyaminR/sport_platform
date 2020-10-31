import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:sport_platform/features/authentication/domain/entity/course_data.dart';
import 'package:sport_platform/features/authentication/domain/entity/criteria_data.dart';
import 'package:sport_platform/features/authentication/domain/repository/courses_repo.dart';
import 'package:sport_platform/utils/error/failure.dart';
import 'package:sport_platform/utils/usecases/params.dart';
import 'package:sport_platform/utils/usecases/usecase.dart';

@singleton
class UpdateCoursesUseCase extends UseCase<CourseData,WithParams>{

  final CoursesRepo repo;

  UpdateCoursesUseCase({@required this.repo});

  CourseData get courseData => null;


  @override
  Future<Either<Failure, CourseData>> call(WithParams params) => repo.updateCourse(courseData);
}