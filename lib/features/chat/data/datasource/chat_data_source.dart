import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:sport_platform/features/chat/data/datamodel/chat_history_data_model.dart';
import 'package:sport_platform/features/chat/data/datamodel/chat_message_data_model.dart';
import 'package:sport_platform/features/chat/domain/entity/chat_message.dart';
import 'package:sport_platform/utils/error/failure.dart';

abstract class ChatDataSource{
  Future<Stream<List<ChatMessageDataModel>>> getChats(String userID);
  Future<ChatMessageDataModel> sendMessage(ChatMessage messageData);
  Future<ChatMessageDataModel> updateMessage(ChatMessage messageData);
  Future<Stream<List<ChatHistoryDataModel>>> getChatHistory();
}

@Singleton(as:ChatDataSource)
class ChatDataSourceImpl implements ChatDataSource{
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;
  final FirebaseFunctions functions;

  ChatDataSourceImpl({@required this.firestore,@required this.auth, @required this.functions, });



  @override
  Future<Stream<List<ChatMessageDataModel>>> getChats(String userID) async{
    try {
      String uid = auth.currentUser.uid;
      var chatID = "";
      if (uid.compareTo(userID) >= 0)
        chatID = uid + userID;
      else
        chatID = userID + uid;

      var stream = firestore
          .collection('Chats')
          .doc(chatID)
          .collection('Messages')
          .orderBy('date')
          .snapshots()
          .map((event) => event.docs.map((e) => ChatMessageDataModel.fromMap(e.data())).toList());

      return stream;
    } on Exception catch (e) {
      print("ERROR"+e.toString());
      throw ServerFailure();
    }
  }

  @override
  Future<ChatMessageDataModel> sendMessage(ChatMessage messageData) async{
    try {
      var sendMessageFunction = functions.httpsCallable('sendMessage');
      var sendRes = await sendMessageFunction.call(ChatMessageDataModel.toMap(messageData));
      return ChatMessageDataModel.fromChatMessage(messageData);
    } on Exception catch (e) {
      print(e.toString());
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

  @override
  Future<Stream<List<ChatHistoryDataModel>>> getChatHistory() async{
    try {
      String _uid () => auth.currentUser.uid;
      var stream = firestore
          .collection('Users')
          .doc(_uid())
          .collection('ChatHistory')
          .orderBy('date')
          .snapshots()
          .map((event) => event.docs.map((e) => ChatHistoryDataModel.fromMap(e.data())).toList());
      return stream;
    } on Exception catch (e) {
      print(e);
      throw ServerFailure();
    }
  }


}