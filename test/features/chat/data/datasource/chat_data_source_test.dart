
import 'package:cloud_firestore_mocks/cloud_firestore_mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sport_platform/features/chat/data/datamodel/chat_conversation_data_model.dart';
import 'package:sport_platform/features/chat/data/datamodel/chat_media_data_model.dart';
import 'package:sport_platform/features/chat/data/datamodel/chat_message_data_model.dart';
import 'package:sport_platform/features/chat/data/datasource/chat_data_source.dart';
import 'package:sport_platform/features/chat/domain/entity/chat_criteria.dart';

main() {
  final firestore = MockFirestoreInstance();
  final dataSource = ChatDataSourceImpl(firestore: firestore);
  final testMessage = ChatMessageDataModel(
      sentDate: 'sentDate',
      sender: 'me',
      receiver: 'you',
      receivedDate: 'receivedDate',
      mediaData: ChatMediaDataModel(
        mediaType: 'photo',
        source: 'source',
      ),
      text: 'sup!');

  final testConversations = [ChatConversationDataModel(messages: [testMessage])];
  final criteria = ChatCriteria(filter: null, data: null);


  group('ChatDataSource ',(){
    group('sendMessage ',(){
      test('should add a Message',()async{
        //act
        var res = await dataSource.sendMessage(testMessage);
        //assert
        expect(res, testMessage);
      });
    });

    group('getChats ',(){
      test('should get Specific Message', () async{
        //arrange
        var searchData = 'me';
        var criteriaData = ChatCriteria(data: searchData,filter: 'sender');
        await dataSource.sendMessage(testMessage);
        //act
        var res = await dataSource.getChats(criteriaData);

        //assert
        expect(res[0].sender, searchData);
      });

    });

    group('updateMessage ', (){
      test('should update the message',()async{
        //arrange
        await dataSource.sendMessage(testMessage);
        //act
        var changedMessageDataModel = ChatMessageDataModel(
            sentDate: 'sentDate',
            sender: 'me',
            receiver: 'you',
            receivedDate: 'receivedDate',
            mediaData: ChatMediaDataModel(
              mediaType: 'photo',
              source: 'source',
            ),
            text: 'sup');

        var res = await dataSource.updateMessage(changedMessageDataModel);
        //assert
        expect(res.text,'sup');
      });
    });

  });
}