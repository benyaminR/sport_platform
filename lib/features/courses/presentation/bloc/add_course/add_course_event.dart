part of 'add_course_bloc.dart';

@immutable
abstract class AddCourseEvent extends Equatable{}

class AddCourseToLibraryEvent extends AddCourseEvent{
  final Course course;

  AddCourseToLibraryEvent({@required this.course});

  @override
  List<Object> get props => [course];
}