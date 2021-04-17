part of 'user_bloc.dart';

@immutable
abstract class UserEvent extends Equatable{}

class GetUserEvent extends UserEvent{
  final String userID;

  GetUserEvent({@required this.userID});

  @override
  List<Object> get props => [userID];

}