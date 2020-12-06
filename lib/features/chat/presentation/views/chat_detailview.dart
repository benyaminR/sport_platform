import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_platform/container.dart';
import 'package:sport_platform/features/chat/presentation/bloc/chat/chat_bloc.dart';
import 'package:sport_platform/features/chat/presentation/bloc/chat/chat_event.dart';
import 'package:sport_platform/features/chat/presentation/bloc/chat/chat_state.dart';
import 'package:sport_platform/features/chat/presentation/views/chat_element_detailview_message.dart';
import 'package:sport_platform/utils/criteria.dart';

import 'chat_element_detailview.dart';
import 'chat_element_detailview_top.dart';


class ChatDetailview extends StatelessWidget {
  final String other = '@You';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            BlocProvider.value(
              value: getIt<ChatBloc>()..add(GetChatsEvent(criteriaData: Criteria(data: other,field: 'receiver'))),
              child: BlocBuilder<ChatBloc,ChatState>(builder:(context, state) {
                if(state is LoadedChatsState){
                  return Padding(
                    padding: const EdgeInsets.only(top: 80.0),
                    child: SingleChildScrollView(
                      child: Column(
                        children: state.conversations.map((e) =>
                            ChatElementDetailview(
                              side: e.sender == '@Me' ? 'right':'left',
                              message: e.text,
                              time: e.sentDate,)
                          ,).toList(),
                      ),
                    ),
                  );
                }
                if(state is LoadingChatsState){
                  return CircularProgressIndicator();
                }
                if(state is ErrorChatsState){
                  return Text(state.msg);
                }
                return Container();
              },),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: ChatElementDetailviewTop(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 650.0),
              child: ChatElementDetailviewMessage(),
            ),
          ],
        ),
      ),
    );
  }
}
