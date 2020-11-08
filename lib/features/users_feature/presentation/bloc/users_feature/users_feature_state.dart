part of 'users_feature_bloc.dart';

@immutable
abstract class UsersFeatureState extends Equatable{}


class IdleUsersFeaturesState extends UsersFeatureState{
  @override
  List<Object> get props => [];
}

class LoadingUsersFeaturesState extends UsersFeatureState{
  @override
  List<Object> get props => [];
}

class LoadedUsersFeaturesState extends UsersFeatureState{
  final List<User> users;

  LoadedUsersFeaturesState({@required this.users});

  @override
  List<Object> get props => [users];
}


class ErrorUsersFeaturesState extends UsersFeatureState{
  final String msg;

  ErrorUsersFeaturesState({@required this.msg});

  @override
  List<Object> get props => [msg];
}