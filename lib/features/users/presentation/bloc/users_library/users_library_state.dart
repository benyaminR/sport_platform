part of 'users_library_bloc.dart';

@immutable
abstract class UsersLibraryState extends Equatable{}

class InitialUsersLibraryState extends UsersLibraryState {
  @override
  List<Object> get props => [];

}

class HasPurchasedCourseState extends UsersLibraryState{
  final bool hasPurchased;
  HasPurchasedCourseState({@required this.hasPurchased});

  @override
  List<Object> get props => [hasPurchased];
}

class LoadingUsersLibraryState extends UsersLibraryState{
  @override
  List<Object> get props => [];
}

class ErrorUsersLibraryState extends UsersLibraryState{
  final String msg;

  ErrorUsersLibraryState({@required this.msg});
  @override
  List<Object> get props => [msg];
}