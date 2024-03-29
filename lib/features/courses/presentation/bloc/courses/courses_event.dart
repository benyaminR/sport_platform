part of 'courses_bloc.dart';

@immutable
abstract class CoursesEvent extends Equatable{}

class GetCoursesEvent extends CoursesEvent{
  final Criteria criteriaData;
  GetCoursesEvent({@required this.criteriaData});
  @override
  List<Object> get props => [criteriaData];
}


class GetCourseEvent extends CoursesEvent{
  final String id;
  GetCourseEvent({@required this.id});
  @override
  List<Object> get props => [id];
}

class AddCoursesEvent extends CoursesEvent{
  final Course course;
  AddCoursesEvent({@required this.course});

  @override
  List<Object> get props => [];
}

class UpdateCoursesEvent extends CoursesEvent{
  final Course course;

  UpdateCoursesEvent({@required this.course});

  @override
  List<Object> get props => [course];
}

class DeleteCoursesEvent extends CoursesEvent{
  final String path;
  DeleteCoursesEvent({@required this.path});

  @override
  List<Object> get props => [path];
}


