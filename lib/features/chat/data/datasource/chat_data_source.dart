import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:sport_platform/features/chat/data/datamodel/chat_message_data_model.dart';
import 'package:sport_platform/features/chat/domain/entity/chat_criteria.dart';

abstract class ChatDataSource{
  Future<List<ChatMessageDataModel>> getChats(ChatCriteria criteriaData);
  Future<ChatMessageDataModel> sendMessage(ChatMessageDataModel messageData);
  Future<ChatMessageDataModel> updateMessage(ChatMessageDataModel messageData);
}

class ChatDataSourceImpl implements ChatDataSource{
  final FirebaseFirestore firestore;

  ChatDataSourceImpl({@required this.firestore});

  @override
  Future<List<ChatMessageDataModel>> getChats(ChatCriteria criteriaData) async{
    if(criteriaData != null) {
      var res = await firestore.collection('Chats').where(
          criteriaData.filter, isEqualTo: criteriaData.data).get();

      return res.docs.map((e) => ChatMessageDataModel.fromMap(e.data())).toList();
    }
    else{
      var res = await firestore.collection('Chats').get();
      return res.docs.map((e) => ChatMessageDataModel.fromMap(e.data())).toList();
    }
  }

  @override
  Future<ChatMessageDataModel> sendMessage(ChatMessageDataModel messageData) async{
    await firestore.
    collection('Chats').
    add(messageData.toMap());
    return messageData;
  }

  @override
  Future<ChatMessageDataModel> updateMessage(ChatMessageDataModel messageData) async{
    (await firestore.collection('Chats')
        .where('receiver',isEqualTo: messageData.receiver)
        .where('sender', isEqualTo: messageData.sender)
        .limit(1)
        .get()
    ).
    docs[0]
        .reference
        .update(
        messageData.toMap()
    );
    return messageData;
  }


}