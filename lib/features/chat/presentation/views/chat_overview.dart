import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_platform/container.dart';
import 'package:sport_platform/features/chat/domain/entity/chat_history.dart';
import 'package:sport_platform/features/chat/presentation/bloc/chat/chat_bloc.dart';
import 'package:sport_platform/features/chat/presentation/bloc/chat/chat_event.dart';
import 'package:sport_platform/features/chat/presentation/bloc/chat/chat_state.dart';
import 'package:sport_platform/features/chat/presentation/views/chat_element_overview.dart';

class ChatOverview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
          child: BlocProvider.value(
            value: getIt<ChatBloc>()..add(GetChatHistoryEvent()),
            child: BlocBuilder<ChatBloc,ChatState>(
              builder: (context, state) {
                if(state is LoadedChatHistory){
                  return StreamBuilder<List<ChatHistory>>(
                    stream: state.history,
                    builder: (context, snapshot) {
                      return Column(
                        children: snapshot.data.map((e) =>
                            ChatElementOverview(
                                imageUrl: e.profileImage,
                                username: e.sender,
                                lastMsg: e.text,
                                date: e.date,
                                unreadCount: 5)
                        ).toList(),
                      );
                    }
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
