import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:sport_platform/features/chat/domain/entity/chat_message.dart';

@immutable
abstract class ChatEvent extends Equatable{}


class GetChatsEvent extends ChatEvent{
  final String userID;

  GetChatsEvent({@required this.userID});

  @override
  List<Object> get props => [userID];
}

class SendMessageEvent extends ChatEvent{
  final ChatMessage messageData;

  SendMessageEvent({@required this.messageData});

  @override
  List<Object> get props => [messageData];
}

class UpdateMessageEvent extends ChatEvent{
  final ChatMessage messageData;

  UpdateMessageEvent({@required this.messageData});

  @override
  List<Object> get props => [messageData];
}
class GetChatHistoryEvent extends ChatEvent{
  GetChatHistoryEvent();
  @override
  List<Object> get props => [];
}





