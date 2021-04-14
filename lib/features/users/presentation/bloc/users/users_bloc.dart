import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:sport_platform/features/users/domain/entity/user.dart';
import 'package:sport_platform/features/users/domain/usecase/add_user_use_case.dart';
import 'package:sport_platform/features/users/domain/usecase/get_users_use_case.dart';
import 'package:sport_platform/features/users/domain/usecase/has_purchased_course.dart';
import 'package:sport_platform/features/users/domain/usecase/remove_users_use_case.dart';
import 'package:sport_platform/features/users/domain/usecase/update_update_use_case.dart';
import 'package:sport_platform/utils/criteria.dart';

import 'package:sport_platform/utils/usecases/params.dart';

part 'users_event.dart';
part 'users_state.dart';

@singleton
class UsersBloc extends Bloc<UsersEvent, UsersState> {

  final AddUserUseCase addUserUseCase;
  final GetUsersUseCase getUsersUseCase;
  final RemoveUserUseCase removeUserUseCase;
  final UpdateUserUseCase updateUserUseCase;

  UsersBloc({@required this.addUserUseCase, @required this.getUsersUseCase, @required this.removeUserUseCase, @required this.updateUserUseCase}) : super(IdleUsersState());

  static const GET_USERS_ERROR = 'Failed To Get!';
  static const ADD_USER_ERROR = 'Failed To Add!';
  static const REMOVE_USER_ERROR = 'Failed To Remove!';
  static const UPDATE_USER_ERROR = 'Failed To Update!';



  @override
  Stream<UsersState> mapEventToState(UsersEvent event) async* {
    //AddTrainerEvent
    if(event is AddUserEvent){
      yield LoadingUsersState();
      var data = await addUserUseCase(WithParams(param:event.user));
      yield data.fold(
              (l) => ErrorUsersState(msg: ADD_USER_ERROR),
              (r) => LoadedUsersState(users: [r])
      );
    }

    //GetTrainersEvent
    if(event is GetUsersEvent){
      yield LoadingUsersState();
      var data = await getUsersUseCase(WithParams(param:event.criteria));
      yield data.fold(
              (l) => ErrorUsersState(msg: GET_USERS_ERROR),
              (r) => LoadedUsersState(users: r)
      );
    }

    //RemoveTrainerEvent
    if(event is RemoveUserEvent){
      yield LoadingUsersState();
      var data = await removeUserUseCase(WithParams(param:event.username));
      yield data.fold(
              (l) => ErrorUsersState(msg: REMOVE_USER_ERROR),
              (r) => LoadedUsersState(users: [r])
      );
    }

    //UpdateTrainerEvent
    if(event is UpdateUserEvent){
      yield LoadingUsersState();
      var data = await updateUserUseCase(WithParams(param:event.user));
      yield data.fold(
              (l) => ErrorUsersState(msg: UPDATE_USER_ERROR),
              (r) => LoadedUsersState(users: [r])
      );
    }

  }
}
