part of 'add_course_bloc.dart';

@immutable
abstract class AddCourseState extends Equatable{}

class InitialAddCourseState extends AddCourseState {
  @override
  List<Object> get props => throw UnimplementedError();
}


class ErrorAddingCourse extends AddCourseState{
  final String msg;

  ErrorAddingCourse({@required this.msg});

  @override
  List<Object> get props => [msg];
}

class AddedCourseState extends AddCourseState{
  final Course course;

  AddedCourseState({@required this.course});
  @override
  List<Object> get props => [course];
}

class AddingCourse extends AddCourseState{
  AddingCourse();
  @override
  List<Object> get props => [];
}