import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:sport_platform/features/chat/domain/entity/conversation.dart';
import 'package:sport_platform/features/chat/domain/entity/message.dart';

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
  final List<Conversation> conversations;

  LoadedChatsState({@required this.conversations});

  @override
  List<Object> get props => [conversations];
}

class LoadedMessageState extends ChatState{
  final Message message;

  LoadedMessageState({@required this.message});

  @override
  List<Object> get props => [message];
}


class ErrorChatsState extends ChatState{
  final String msg;

  ErrorChatsState({@required this.msg});

  @override
  List<Object> get props => [msg];
}