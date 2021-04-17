part of 'user_bloc.dart';

@immutable
abstract class UserState extends Equatable{}

class InitialUserState extends UserState {
  @override
  List<Object> get props => [];

}

class LoadingUserState extends UserState{
  @override
  List<Object> get props => [];
}

class LoadedUserState extends UserState{
  final User user;
  LoadedUserState({@required this.user});
  @override
  List<Object> get props => [user];
}

class ErrorUserState extends UserState{
  final String msg;

  ErrorUserState({@required this.msg});

  @override
  List<Object> get props => [msg];
}
