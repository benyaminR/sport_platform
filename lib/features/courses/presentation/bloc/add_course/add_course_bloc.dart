import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'add_course_event.dart';

part 'add_course_state.dart';

class AddCourseBloc extends Bloc<AddCourseEvent, AddCourseState> {
  @override
  AddCourseState get initialState => InitialAddCourseState();

  @override
  Stream<AddCourseState> mapEventToState(AddCourseEvent event) async* {
    // TODO: Add your event logic
  }
}
