part of 'users_feature_bloc.dart';

@immutable
abstract class UsersFeatureEvent extends Equatable{}


class AddUserEvent extends UsersFeatureEvent{
  final User userData;

  AddUserEvent({@required this.userData});

  @override
  List<Object> get props => [userData];
}

class GetUsersEvent extends UsersFeatureEvent{
  final Criteria criteriaData;

  GetUsersEvent({@required this.criteriaData});

  @override
  List<Object> get props => [criteriaData];
}

class RemoveUserEvent extends UsersFeatureEvent{
  final String uid;

  RemoveUserEvent({@required this.uid});

  @override
  List<Object> get props => [uid];
}

class UpdateUserEvent extends UsersFeatureEvent{
  final User userData;

  UpdateUserEvent({@required this.userData});

  @override
  List<Object> get props => [userData];
}



