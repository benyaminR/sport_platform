part of 'courses_bloc.dart';

@immutable
abstract class CoursesState extends Equatable{}

@singleton
class IdleCoursesState extends CoursesState{
  @override
  List<Object> get props => [];
}

class LoadingCoursesState extends CoursesState{
  @override
  List<Object> get props => [];
}

class LoadedCoursesState extends CoursesState{
  final List<Course> courses;

  LoadedCoursesState({@required this.courses});

  @override
  List<Object> get props => [courses];
}

class LoadedCourseState extends CoursesState{
  final Course course;

  LoadedCourseState({@required this.course});
  @override
  List<Object> get props => [course];
}

class ErrorCoursesState extends CoursesState{
  final String msg;

  ErrorCoursesState({@required this.msg});

  @override
  List<Object> get props => [msg];
}
