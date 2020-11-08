import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:sport_platform/features/chat/domain/usecase/get_chats_use_case.dart';
import 'package:sport_platform/features/chat/domain/usecase/send_message_use_case.dart';
import 'package:sport_platform/features/chat/domain/usecase/update_message_use_case.dart';
import 'package:sport_platform/utils/usecases/params.dart';

import 'chat_event.dart';
import 'chat_state.dart';


class ChatBloc extends Bloc<ChatEvent, ChatState> {

  final GetChatsUseCase getChatsUseCase;
  final SendMessageUseCase sendMessageUseCase;
  final UpdateMessageUseCase updateMessageUseCase;

  ChatBloc(ChatState initialState, this.getChatsUseCase, this.sendMessageUseCase, this.updateMessageUseCase) : super(initialState);

  @override
  Stream<ChatState> mapEventToState(ChatEvent event) async* {
    //GetChatsEvent
    if(event is GetChatsEvent){
      yield LoadingChatsState();
      var data = await getChatsUseCase(WithParams(param:event.criteriaData));
      yield data.fold(
              (l) => ErrorChatsState(msg: 'Error'),
              (r) => LoadedChatsState(conversations: r)
      );
    }
    //SendMessageEvent
    if(event is SendMessageEvent){
      yield LoadingChatsState();
      var data = await sendMessageUseCase(WithParams(param:event.messageData));
      yield data.fold(
              (l) => ErrorChatsState(msg: 'Error'),
              (r) => LoadedMessageState(message: r)
      );
    }
    //UpdateMessageEvent
    if(event is UpdateMessageEvent){
      yield LoadingChatsState();
      var data = await updateMessageUseCase(WithParams(param:event.messageData));
      yield data.fold(
              (l) => ErrorChatsState(msg: 'Error'),
              (r) => LoadedMessageState(message: r)
      );
    }
  }
}
