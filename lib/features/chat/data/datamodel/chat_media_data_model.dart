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

  Map<String,dynamic> toMap()=>{
    'source':source,
    'mediaType':mediaType,
  };

}