import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:sport_platform/archive/chat/data/datamodel/chat_media_data_model.dart';
import 'package:sport_platform/archive/chat/domain/entity/chat_message.dart';

class ChatMessageDataModel extends ChatMessage {

  final ChatMediaDataModel mediaData;

  ChatMessageDataModel({
    @required receiver,
    @required sender,
    @required this.mediaData,
    @required text,
    @required sentDate,
    @required receivedDate,
  })
      :super(
    receiver: receiver,
    sender: sender,
    mediaData: mediaData,
    text: text,
    sentDate: sentDate,
    receivedDate: receivedDate,
  );

  factory ChatMessageDataModel.fromMap(Map<dynamic,dynamic> data)=> ChatMessageDataModel(
    text:data['text'] ,
    mediaData: ChatMediaDataModel.fromMap(data['mediaData']),
    receivedDate: data['date'],
    receiver: data['receiver'],
    sender: data['sender'],
    sentDate: data['date']
  );

  static Map<String, dynamic> toMap(ChatMessage message) => {
    'receiver':message.receiver,
    'sender':message.sender,
    'mediaData': ChatMediaDataModel.toMap(message.mediaData),
    'text':message.text,
    'date':message.sentDate,
    'receivedDate':message.receivedDate,
  };

  static ChatMessageDataModel fromChatMessage(ChatMessage messageData)=>
      ChatMessageDataModel(
          receiver: messageData.receiver,
          sender: messageData.sender,
          mediaData: ChatMediaDataModel.fromChatMedia( messageData.mediaData),
          text: messageData.text,
          sentDate: messageData.sentDate,
          receivedDate: messageData.receivedDate
      );

}