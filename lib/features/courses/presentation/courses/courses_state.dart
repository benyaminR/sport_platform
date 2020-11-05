part of 'courses_bloc.dart';

@immutable
abstract class CoursesState extends Equatable{}


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


class ErrorCoursesState extends CoursesState{
  final String msg;

  ErrorCoursesState({@required this.msg});

  @override
  List<Object> get props => [msg];
}

