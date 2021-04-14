import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:sport_platform/features/courses/domain/enitity/course.dart';
import 'package:sport_platform/features/courses/domain/usecase/add_course_to_library_use_case.dart';
import 'package:sport_platform/utils/usecases/params.dart';

part 'add_course_event.dart';

part 'add_course_state.dart';

@singleton
class AddCourseBloc extends Bloc<AddCourseEvent, AddCourseState> {


  final AddCourseToLibraryUseCase addCourseToLibraryUseCase;
  final String GET_COURSE_ERROR = "Something Went Wrong :-(";

  AddCourseBloc({@required this.addCourseToLibraryUseCase}) : super(InitialAddCourseState());

  @override
  AddCourseState get initialState => InitialAddCourseState();

  @override
  Stream<AddCourseState> mapEventToState(AddCourseEvent event) async* {
    if(event is AddCourseToLibraryEvent){
      yield AddingCourse();
      var data = await addCourseToLibraryUseCase(WithParams(param:event.course));
      yield data.fold(
              (l) => ErrorAddingCourse(msg: GET_COURSE_ERROR),
              (r) => AddedCourseState(course: r)
      );
    }  }
}
