part of 'users_bloc.dart';

@immutable
abstract class UsersEvent extends Equatable {}

class AddUserEvent extends UsersEvent {
  final User user;

  AddUserEvent({@required this.user});

  @override
  List<Object> get props => [user];
}

class GetUsersEvent extends UsersEvent {
  final Criteria criteria;

  GetUsersEvent({@required this.criteria});

  @override
  List<Object> get props => [criteria];
}

class RemoveUserEvent extends UsersEvent {
  final String username;

  RemoveUserEvent({@required this.username});

  @override
  List<Object> get props => [username];
}

class UpdateUserEvent extends UsersEvent {
  final User user;

  UpdateUserEvent({@required this.user});

  @override
  List<Object> get props => [user];
}
