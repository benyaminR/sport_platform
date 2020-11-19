part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationEvent extends Equatable{
}


class SignInWithGoogleEvent extends AuthenticationEvent{
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
class RegisterWithEmailEvent extends AuthenticationEvent{
  final String email;
  final String password;

  RegisterWithEmailEvent({@required this.email,@required this.password});

  @override
  List<Object> get props => [email,password];
}

class ResetPasswordEvent extends AuthenticationEvent{
  final String email;

  ResetPasswordEvent({@required this.email});

  @override
  List<Object> get props => [email];
}
