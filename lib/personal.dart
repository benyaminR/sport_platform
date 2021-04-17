import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_platform/personal_main_body.dart';
import 'container.dart';
import 'features/users/presentation/bloc/user/user_bloc.dart';

class Personal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context).settings.arguments as PersonalArgs;
    String userID = '';
    if (args != null) userID = args.userID;
    return Scaffold(
      body: BlocProvider.value(value:getIt.get<UserBloc>()..add(GetUserEvent(userID: userID)),
        child: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            print("current State "+ state.toString());
            if (state is LoadingUserState)
              return loadingUsersWidget();
            if (state is LoadedUserState)
              return PersonalMainBody(user:state.user);
            if (state is ErrorUserState)
              return errorGettingUserWidget(state.toString());
            getIt.get<UserBloc>()..add(GetUserEvent(userID: userID));
            return Container();
          },
        ),
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


class PersonalArgs{

  final String userID;

  PersonalArgs({@required this.userID});
}
