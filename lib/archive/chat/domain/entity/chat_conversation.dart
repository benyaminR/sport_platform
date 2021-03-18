import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import 'chat_message.dart';

class ChatConversation extends Equatable{
  final List<ChatMessage> messages;
  ChatConversation({@required this.messages});
  @override
  List<Object> get props => [messages];
}