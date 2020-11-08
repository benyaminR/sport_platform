import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:sport_platform/features/courses/domain/enitity/course.dart';
import 'package:sport_platform/features/courses/domain/enitity/criteria.dart';
import 'package:sport_platform/features/courses/domain/usecase/add_course_use_case.dart';
import 'package:sport_platform/features/courses/domain/usecase/delete_course_use_case.dart';
import 'package:sport_platform/features/courses/domain/usecase/get_courses_use_case.dart';
import 'package:sport_platform/features/courses/domain/usecase/update_course_use_case.dart';
import 'package:sport_platform/utils/usecases/params.dart';

part 'courses_event.dart';
part 'courses_state.dart';

@singleton
class CoursesBloc extends Bloc<CoursesEvent, CoursesState> {

  final GetCourseUseCase getCourseUseCase;
  final UpdateCourseUseCase updateCourseUseCase;
  final AddCourseUseCase addCourseUseCase;
  final DeleteCourseUseCase deleteCourseUseCase;

  final IdleCoursesState initialState;

  CoursesBloc({this.initialState, this.getCourseUseCase, this.updateCourseUseCase, this.addCourseUseCase, this.deleteCourseUseCase}) : super(initialState);

  @override
  Stream<CoursesState> mapEventToState(CoursesEvent event) async* {
    //GetCoursesEvent
    if(event is GetCoursesEvent){
      yield LoadingCoursesState();
      var data = await getCourseUseCase(WithParams(param:event.criteriaData));
      yield data.fold(
              (l) => ErrorCoursesState(msg: 'Error'),
              (r) => LoadedCoursesState(courses: r)
      );
    }
    //UpdateCoursesEvent
    if(event is UpdateCoursesEvent){
      yield LoadingCoursesState();
      var data = await updateCourseUseCase(WithParams(param:event.course));
      yield data.fold(
              (l) => ErrorCoursesState(msg: 'Error'),
              (r) => LoadedCoursesState(courses: [r])
      );
    }
    //AddCoursesEvent
    if(event is AddCoursesEvent){
      yield LoadingCoursesState();
      var data = await addCourseUseCase(WithParams(param:event.course));
      yield data.fold(
              (l) => ErrorCoursesState(msg: 'Error'),
              (r) => LoadedCoursesState(courses: [r])
      );
    }
    //RemoveCoursesEvent
    if(event is DeleteCoursesEvent){
      yield LoadingCoursesState();
      var data = await deleteCourseUseCase(WithParams(param:event.path));
      yield data.fold(
              (l) => ErrorCoursesState(msg: 'Error'),
              (r) => LoadedCoursesState(courses: [r])
      );
    }


  }
}
