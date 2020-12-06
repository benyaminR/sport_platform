import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_platform/container.dart';
import 'package:sport_platform/features/chat/presentation/bloc/chat/chat_bloc.dart';
import 'package:sport_platform/features/chat/presentation/bloc/chat/chat_event.dart';
import 'package:sport_platform/features/chat/presentation/bloc/chat/chat_state.dart';
import 'package:sport_platform/features/chat/presentation/views/chat_element_overview.dart';

class ChatOverview extends StatefulWidget {
  ChatOverview();

  _ChatOverviewState createState() => _ChatOverviewState();
}

class _ChatOverviewState extends State<ChatOverview> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
          child: BlocProvider.value(
            value: getIt<ChatBloc>()..add(GetChatsEvent(criteriaData: null)),
            child: BlocBuilder<ChatBloc,ChatState>(
              builder: (context, state) {
                if(state is LoadedChatsState){
                  return Column(
                    children: state.conversations.map((e) =>
                        ChatElementOverview(
                            imageUrl: '/Users/face_00.jpg',
                            username: e.sender,
                            lastMsg: e.text,
                            date: e.receivedDate,
                            unreadCount: 5)
                    ).toList(),
                  );
                }else if(state is LoadingChatsState){
                  return CircularProgressIndicator();
                }else if(state is ErrorChatsState){
                  return Text(state.msg);
                }
                return Container();
              },
            ),
          )
      ),
    );
  }
}
