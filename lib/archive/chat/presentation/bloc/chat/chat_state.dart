import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:sport_platform/archive/chat/domain/entity/chat_history.dart';
import 'package:sport_platform/archive/chat/domain/entity/chat_message.dart';

@immutable
abstract class ChatState extends Equatable{}

class IdleChatsState extends ChatState{
  @override
  List<Object> get props => [];
}

class LoadingChatsState extends ChatState{
  @override
  List<Object> get props => [];
}

class LoadedChatsState extends ChatState{
  final Stream<List<ChatMessage>> messages;

  LoadedChatsState({@required this.messages});

  @override
  List<Object> get props => [messages];
}

class LoadedMessageState extends ChatState{
  final ChatMessage message;

  LoadedMessageState({@required this.message});

  @override
  List<Object> get props => [message];
}
class LoadedChatHistory extends ChatState{
  final Stream<List<ChatHistory>> history;

  LoadedChatHistory({@required this.history});

  @override
  List<Object> get props => [history];
}

class ErrorChatsState extends ChatState{
  final String msg;

  ErrorChatsState({@required this.msg});

  @override
  List<Object> get props => [msg];
}