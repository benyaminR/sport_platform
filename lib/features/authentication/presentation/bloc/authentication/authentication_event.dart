part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationEvent extends Equatable{
}

class SignInAnonymouslyEvent extends AuthenticationEvent{
  @override
  List<Object> get props => [];
}

class SignInWithGoogleEvent extends AuthenticationEvent{
  @override
  List<Object> get props => [];
}
class SignInWithFacebookEvent extends AuthenticationEvent{
  @override
  List<Object> get props => [];
}
class SignInWithEmailEvent extends AuthenticationEvent{
  final String email;
  final String password;

  SignInWithEmailEvent({@required this.email,@required this.password});

  @override
  List<Object> get props => [email,password];
}
class CheckAuthenticationEvent extends AuthenticationEvent{
  @override
  List<Object> get props => [];
}
