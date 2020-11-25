part of 'trainers_bloc.dart';

@immutable
abstract class UsersState extends Equatable{}


class IdleUsersState extends UsersState{
  @override
  List<Object> get props => [];
}

class LoadingUsersState extends UsersState{
  @override
  List<Object> get props => [];
}

class LoadedUsersState extends UsersState{
  final List<User> users;

  LoadedUsersState({@required this.users});

  @override
  List<Object> get props => [users];
}


class ErrorUsersState extends UsersState{
  final String msg;

  ErrorUsersState({@required this.msg});

  @override
  List<Object> get props => [msg];
}