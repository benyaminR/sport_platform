import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:sport_platform/features/chat/domain/entity/chat_conversation.dart';

import 'chat_message_data_model.dart';

class ChatConversationDataModel extends ChatConversation{

  final List<ChatMessageDataModel> messages;

  ChatConversationDataModel({@required this.messages}):super(messages: messages);

  factory ChatConversationDataModel.fromSnapshot(DocumentSnapshot snapshot) => ChatConversationDataModel(
    messages: (snapshot.data()['messages'] as List<dynamic>).map((e) => ChatMessageDataModel.fromMap(e)).toList()
  );

  Map<String, dynamic> toMap()=>{
    'messages' : messages.map((e) => ChatMessageDataModel.toMap(e)).toList()
  };
}