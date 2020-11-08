import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:sport_platform/features/courses/domain/enitity/criteria.dart';
import 'package:sport_platform/features/users_feature/domain/entity/user.dart';
import 'package:sport_platform/features/users_feature/domain/usecase/add_user_use_case.dart';
import 'package:sport_platform/features/users_feature/domain/usecase/get_users_use_case.dart';
import 'package:sport_platform/features/users_feature/domain/usecase/remove_user_use_case.dart';
import 'package:sport_platform/features/users_feature/domain/usecase/update_user_use_case.dart';
import 'package:sport_platform/utils/usecases/params.dart';

part 'users_feature_event.dart';
part 'users_feature_state.dart';


class UsersFeatureBloc extends Bloc<UsersFeatureEvent, UsersFeatureState> {

  final AddUserUseCase addUserUseCase;
  final GetUsersUseCase getUsersUseCase;
  final RemoveUserUseCase removeUserUseCase;
  final UpdateUserUseCase updateUserUseCase;

  UsersFeatureBloc(UsersFeatureState initialState, this.addUserUseCase, this.getUsersUseCase, this.removeUserUseCase, this.updateUserUseCase) : super(initialState);

  @override
  Stream<UsersFeatureState> mapEventToState(UsersFeatureEvent event) async* {
    //AddUserEvent
    if(event is AddUserEvent){
      yield LoadingUsersFeaturesState();
      var data = await addUserUseCase(WithParams(param:event.userData));
      yield data.fold(
              (l) => ErrorUsersFeaturesState(msg: 'Error'),
              (r) => LoadedUsersFeaturesState(users: [r])
      );
    }

    //GetUsersEvent
    if(event is GetUsersEvent){
      yield LoadingUsersFeaturesState();
      var data = await getUsersUseCase(WithParams(param:event.criteriaData));
      yield data.fold(
              (l) => ErrorUsersFeaturesState(msg: 'Error'),
              (r) => LoadedUsersFeaturesState(users: r)
      );
    }

    //RemoveUserEvent
    if(event is RemoveUserEvent){
      yield LoadingUsersFeaturesState();
      var data = await removeUserUseCase(WithParams(param:event.uid));
      yield data.fold(
              (l) => ErrorUsersFeaturesState(msg: 'Error'),
              (r) => LoadedUsersFeaturesState(users: [r])
      );
    }

    //UpdateUserEvent
    if(event is UpdateUserEvent){
      yield LoadingUsersFeaturesState();
      var data = await updateUserUseCase(WithParams(param:event.userData));
      yield data.fold(
              (l) => ErrorUsersFeaturesState(msg: 'Error'),
              (r) => LoadedUsersFeaturesState(users: [r])
      );
    }


  }
}
