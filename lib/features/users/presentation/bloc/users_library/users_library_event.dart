part of 'users_library_bloc.dart';

@immutable
abstract class UsersLibraryEvent extends Equatable{}


class HasPurchasedCourseEvent extends UsersLibraryEvent{
  final String courseID;
  HasPurchasedCourseEvent({@required this.courseID});
  @override
  List<Object> get props => [courseID];

}