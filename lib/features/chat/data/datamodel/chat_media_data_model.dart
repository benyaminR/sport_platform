import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:sport_platform/features/chat/domain/entity/chat_media.dart';

class ChatMediaDataModel extends ChatMedia{


  ChatMediaDataModel({
    @required source,
    @required mediaType
  })
  :super(
      source: source,
      mediaType: mediaType);

  factory ChatMediaDataModel.fromMap(Map<String,dynamic> data) => ChatMediaDataModel(
      source:data['source'],
      mediaType:data['mediaType'],
  );

  static Map<String,dynamic> toMap(ChatMedia media)=>{
    'source':media.source,
    'mediaType':media.mediaType,
  };

  factory ChatMediaDataModel.fromChatMedia(ChatMedia media) => ChatMediaDataModel(
    source:media.source,
    mediaType:media.source,
  );
}