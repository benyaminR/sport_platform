part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationState extends Equatable{}

@singleton
class InitialAuthenticationState extends AuthenticationState {
  @override
  List<Object> get props => [];
}

class SigningInState extends AuthenticationState{
  @override
  List<Object> get props => [];
}

class SignedInState extends AuthenticationState{
  @override
  List<Object> get props => [];
}

class ErrorState extends AuthenticationState{
  final String msg;

  ErrorState({@required this.msg});

  @override
  List<Object> get props => [msg];
}

