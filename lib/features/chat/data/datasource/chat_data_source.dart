import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:sport_platform/features/chat/data/datamodel/chat_message_data_model.dart';
import 'package:sport_platform/features/chat/domain/entity/chat_message.dart';
import 'package:sport_platform/utils/criteria.dart';
import 'package:sport_platform/utils/error/failure.dart';

abstract class ChatDataSource{
  Future<List<ChatMessageDataModel>> getChats(Criteria criteriaData);
  Future<ChatMessageDataModel> sendMessage(ChatMessage messageData);
  Future<ChatMessageDataModel> updateMessage(ChatMessage messageData);
}

@Singleton(as:ChatDataSource)
class ChatDataSourceImpl implements ChatDataSource{
  final FirebaseFirestore firestore;

  ChatDataSourceImpl({@required this.firestore});

  @override
  Future<List<ChatMessageDataModel>> getChats(Criteria criteriaData) async{
    try {
      if(criteriaData != null) {
        var res = await firestore.collection('Chats').where(
            criteriaData.data, isEqualTo: criteriaData.data).get();

        return res.docs.map((e) => ChatMessageDataModel.fromMap(e.data())).toList();
      }
      else{
        var res = await firestore.collection('Chats').get();
        return res.docs.map((e) => ChatMessageDataModel.fromMap(e.data())).toList();
      }
    } on Exception catch (e) {
      throw ServerFailure();
    }
  }

  @override
  Future<ChatMessageDataModel> sendMessage(ChatMessage messageData) async{
    try {
      await firestore.
      collection('Chats').
      add(ChatMessageDataModel.toMap(messageData));
      return ChatMessageDataModel.fromChatMessage(messageData);
    } on Exception catch (e) {
      throw ServerFailure();
    }
  }

  @override
  Future<ChatMessageDataModel> updateMessage(ChatMessage messageData) async{
    try {
      (await firestore.collection('Chats')
          .where('receiver',isEqualTo: messageData.receiver)
          .where('sender', isEqualTo: messageData.sender)
          .where('sentDate', isEqualTo: messageData.sentDate)
          .limit(1)
          .get()
      ).
      docs[0]
          .reference
          .update(
          ChatMessageDataModel.toMap(messageData)
      );
      return ChatMessageDataModel.fromChatMessage(messageData);
    } on Exception catch (e) {
      throw ServerFailure();
    }
  }


}