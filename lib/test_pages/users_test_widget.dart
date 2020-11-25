import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_platform/container.dart';
import 'package:sport_platform/features/users/data/datamodel/user_data_model.dart';
import 'package:sport_platform/features/users/domain/entity/tip.dart';
import 'package:sport_platform/features/users/domain/entity/user.dart';
import 'package:sport_platform/features/users/domain/entity/user_course.dart';
import 'package:sport_platform/features/users/presentation/bloc/users/users_bloc.dart';

class UsersTestWidget extends StatelessWidget {

  var user = User(
      tips: [Tip(date: 'date', category: 'health', content: 'trink genugend wasser')],
      joinedDate: 'date',
      description: 'description',
      username: 'username' + Random().nextInt(10000).toString(),
      subscription: 'subscription',
      profileImage: 'profileImage',
      friends: ['friend1','anotherFriend'],
      createdCourses: [UserCourse(coursePath: 'path', title: 'great Ass')],
      isTrainer: true,
      isVerified: true,
      purchasedCourses: [UserCourse(coursePath: 'path', title: 'great tits')]
  );

  var username = '';
  List<User> users = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height -100,
            child: Center(
              child: BlocProvider.value(
                value: getIt<UsersBloc>(),
                child: BlocBuilder<UsersBloc,UsersState>(
                  builder: (context, state){
                    if(state is LoadingUsersState)
                      return CircularProgressIndicator();
                    if(state is ErrorUsersState)
                      return Text(state.msg);
                    if(state is LoadedUsersState) {
                      users = state.users;
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SingleChildScrollView(child: Text(state.users.map((e) => UserDataModel.toMap(e)).toString())),
                      );
                    }
                    return Text('...');
                  },
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                FlatButton(
                    onPressed: () => getIt<UsersBloc>().add(AddUserEvent(user: user)),
                    child: Text('Add')
                ),
                FlatButton(
                    onPressed:()=> getIt<UsersBloc>().add(GetUsersEvent(criteria: null)),
                    child: Text('Get')
                ),
                FlatButton(
                    onPressed:()=> getIt<UsersBloc>().add(RemoveUserEvent(username: users[0].username)),
                    child: Text('Delete')
                ),
                FlatButton(
                    onPressed:(){
                      var updatedUser = User(
                          tips: [Tip(date: 'date', category: 'health', content: 'trink genugend wasser')],
                          joinedDate: 'date',
                          description: 'updated user bro!',
                          username: users[0].username,
                          subscription: 'subscription',
                          profileImage: 'profileImage',
                          friends: ['friend1','anotherFriend'],
                          createdCourses: [UserCourse(coursePath: 'path', title: 'great Ass')],
                          isTrainer: true,
                          isVerified: true,
                          purchasedCourses: [UserCourse(coursePath: 'path', title: 'great tits')]
                      );

                      getIt<UsersBloc>().add(UpdateUserEvent(user: updatedUser));
                    },
                    child: Text('Update')
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
