import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_platform/container.dart';
import 'package:sport_platform/features/authentication/presentation/bloc/authentication/authentication_bloc.dart';
import 'package:sport_platform/features/chat/domain/entity/chat_media.dart';
import 'package:sport_platform/features/chat/domain/entity/chat_message.dart';
import 'package:sport_platform/features/chat/presentation/bloc/chat/chat_bloc.dart';
import 'package:sport_platform/features/chat/presentation/bloc/chat/chat_event.dart';
import 'package:sport_platform/features/chat/presentation/bloc/chat/chat_state.dart';

class ChatTestWidget extends StatelessWidget {
  var index = 0;
  var sampleMessage = ChatMessage(
      receiver: '@You',
      sender: '@Me',
      mediaData: ChatMedia(source: '',mediaType: ''),
      text: 'Hello '+Random().nextInt(100000).toString(),
      sentDate: DateTime.now().toString(),
      receivedDate: ''
  );

  var updatedSampleMessage = ChatMessage(
      receiver: '@You',
      sender: '@Me',
      mediaData: ChatMedia(source: '',mediaType: ''),
      text: 'Hello '+Random().nextInt(100000).toString() + ' got updated!',
      sentDate: '2020-11-22 19:54:02.899723',
      receivedDate: DateTime.now().toString()
  );


  @override
  Widget build(BuildContext context) {
    getIt<AuthenticationBloc>().add(SignInWithGoogleEvent());

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 500,
              child: Center(
                child: BlocProvider.value(
                  value: getIt<ChatBloc>(),
                  child: BlocBuilder<ChatBloc,ChatState>(
                    builder: (context, state){
                      index = 0;
                      if(state is LoadingChatsState)
                        return CircularProgressIndicator();
                      if(state is ErrorChatsState)
                        return Text(state.msg);
                      if(state is LoadedChatsState)
                        return SingleChildScrollView(
                            child: Text(state.conversations.map((e) {
                              return '${index++}. '+{
                                'receiver':e.receiver,
                                'sender':e.sender,
                                'mediaData':e.mediaData.toString(),
                                'text':e.text,
                                'sentDate':e.sentDate,
                                'receivedDate':e.receivedDate,
                              }.toString() +'\n\n';
                            }).toList().toString())
                        );
                      return Text('...');
                    },
                  ),
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                FlatButton(
                    onPressed:()=> getIt<ChatBloc>().add(SendMessageEvent(messageData: sampleMessage )),
                    child: Text('Send')
                ),
                FlatButton(
                    onPressed:()=> getIt<ChatBloc>().add(GetChatsEvent(criteriaData: null)),
                    child: Text('Get')
                ),
                FlatButton(
                    onPressed:()=> getIt<ChatBloc>().add(UpdateMessageEvent(messageData: updatedSampleMessage)),
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
