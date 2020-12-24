

import 'package:sport_platform/features/chat/domain/entity/chat_history.dart';

class ChatHistoryDataModel extends ChatHistory{

  ChatHistoryDataModel({senderThumbnail,date,text,sender,uid}):super(profileImage: senderThumbnail,date: date,text: text,sender:sender ,uid:uid);


  factory ChatHistoryDataModel.fromMap(Map<String,dynamic> data)=>ChatHistoryDataModel(
      senderThumbnail: data['profileImage']
      ,date: data['date']
      ,text: data['text']
      ,sender:data['sender'],
      uid: data['uid']
  );
}