import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:sport_platform/archive/chat/domain/usecase/get_chat_history_use_case.dart';
import 'package:sport_platform/archive/chat/domain/usecase/get_chats_use_case.dart';
import 'package:sport_platform/archive/chat/domain/usecase/send_message_use_case.dart';
import 'package:sport_platform/archive/chat/domain/usecase/update_message_use_case.dart';
import 'package:sport_platform/utils/usecases/no_params.dart';
import 'package:sport_platform/utils/usecases/params.dart';

import 'chat_event.dart';
import 'chat_state.dart';

@injectable
class ChatBloc extends Bloc<ChatEvent, ChatState> {

  final GetChatsUseCase getChatsUseCase;
  final SendMessageUseCase sendMessageUseCase;
  final UpdateMessageUseCase updateMessageUseCase;
  final GetChatHistoryUseCase getChatHistoryUseCase;

  ChatBloc(this.getChatsUseCase, this.sendMessageUseCase,
      this.updateMessageUseCase, this.getChatHistoryUseCase)
      : super(IdleChatsState());

  @override
  Stream<ChatState> mapEventToState(ChatEvent event) async* {
    //GetChatsEvent
    if (event is GetChatsEvent) {
      yield LoadingChatsState();
      var data = await getChatsUseCase(WithParams(param: event.userID));
      yield data.fold(
              (l) => ErrorChatsState(msg: 'Error'),
              (r) => LoadedChatsState(messages: r)
      );
    }
    //SendMessageEvent
    if (event is SendMessageEvent) {
      yield LoadingChatsState();
      var data = await sendMessageUseCase(WithParams(param: event.messageData));
      yield data.fold(
              (l) => ErrorChatsState(msg: 'Error'),
              (r) => LoadedMessageState(message: r)
      );
    }
    //UpdateMessageEvent
    if (event is UpdateMessageEvent) {
      yield LoadingChatsState();
      var data = await updateMessageUseCase(
          WithParams(param: event.messageData));
      yield data.fold(
              (l) => ErrorChatsState(msg: 'Error'),
              (r) => LoadedMessageState(message: r)
      );
    }
    //UpdateMessageEvent
    if (event is GetChatHistoryEvent) {
      yield LoadingChatsState();
      var data = await getChatHistoryUseCase(NoParams());

      yield data.fold(
              (l) =>ErrorChatsState(msg: 'Error'),
              (r) =>LoadedChatHistory(history: r));
    }
  }
}
