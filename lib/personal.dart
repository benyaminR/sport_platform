import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_platform/personal_main_body.dart';
import 'container.dart';
import 'features/users/presentation/bloc/users/users_bloc.dart';

class Personal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(value:getIt.get<UsersBloc>()..add(GetUsersEvent(criteria: null)),
      child: BlocBuilder<UsersBloc, UsersState>(
        builder: (context, state) {
          print("current State "+ state.toString());
          if (state is LoadingUsersState)
            return loadingUsersWidget();
          if (state is LoadedUsersState)
            return PersonalMainBody(user:state.users[0]);
          if (state is ErrorUsersState)
            return errorGettingUserWidget(state.msg);
          getIt.get<UsersBloc>()..add(GetUsersEvent(criteria: null));
          return Container();
        },
      ),
    );
  }

  Widget loadingUsersWidget() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget errorGettingUserWidget(String msg) {
    return Center(
      child: Text(msg),
    );
  }
}
