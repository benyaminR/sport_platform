import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:sport_platform/features/chat/data/datamodel/chat_media_data_model.dart';
import 'package:sport_platform/features/chat/domain/entity/chat_message.dart';

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

  factory ChatMessageDataModel.fromMap(Map<String,dynamic> data)=> ChatMessageDataModel(
    text:data['text'] ,
    mediaData: ChatMediaDataModel.fromMap(data['mediaData']),
    receivedDate: data['receivedDate'],
    receiver: data['receiver'],
    sender: data['sender'],
    sentDate: data['sentDate']
  );

  Map<String, dynamic> toMap() => {
    'receiver':receiver,
    'sender':sender,
    'mediaData':mediaData.toMap(),
    'text':text,
    'sentDate':sentDate,
    'receivedDate':receivedDate,
  };

}