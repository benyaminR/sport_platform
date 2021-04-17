import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:sport_platform/features/users/domain/entity/user.dart';
import 'package:sport_platform/features/users/domain/usecase/get_user_use_case.dart';
import 'package:sport_platform/utils/usecases/params.dart';

part 'user_event.dart';
part 'user_state.dart';

@singleton
class UserBloc extends Bloc<UserEvent, UserState> {
  final GetUserUseCase useCase;


  UserBloc({this.useCase}) : super(InitialUserState());

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {

    if(event is GetUserEvent){
      yield LoadingUserState();
      yield (await useCase(WithParams(param:event.userID)))
          .fold(
              (l) => ErrorUserState(msg: l.toString()),
              (r) => LoadedUserState(user: r)
      );
    }
  }
}
